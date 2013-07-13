app.controller "TipCalcController", ($scope, $http, $location, $state, $stateParams) ->
  # Default Options
  $scope.check = 
    total: 10.00
    number_of_people: 4
    gratuity: 0.1
    tax: 0.10

  $scope.persons = []

  # Functions
  computePeople = (new_val, old_val)->
    diff = new_val - old_val
    if not $scope.check.number_of_people
      $scope.persons = []
    else if diff > 0
      for person in [0..(diff - 1)]
        $scope.persons.push {}
    else if diff < 0
      $scope.persons = $scope.persons[0..(new_val-1)]
    computeTotal()

  computeTotal = ->
    gratuity = parseFloat($scope.check.gratuity)
    tax = parseFloat($scope.check.tax)
    for person,index in $scope.persons
      person.name ||= "Person #{index + 1}"
      person.items ||= []
    $scope.check.raw_total = $scope.check.total / (1 + tax)
    $scope.check.grand_total = $scope.check.total * (1 + gratuity)

    computePerPerson()

  computePerPerson = ->
    tax = parseFloat($scope.check.tax)
    gratuity = parseFloat($scope.check.gratuity)
    raw_total = 0
    locked_persons = $scope.persons.filter (x) ->
      x.locked

    unlocked_persons = $scope.persons.filter (x) ->
      !x.locked

    for person in locked_persons
      cost = 0
      for item in person.items
        cost += parseFloat(item.cost || 0)

      person.raw_total = cost
      raw_total += cost

    for person in $scope.persons when not person.locked
      person.raw_total = (($scope.check.raw_total - raw_total) / unlocked_persons.length).toFixed(2)

    for person in $scope.persons
      person.total = person.raw_total * (1 + tax) * (1 + gratuity)

    total_paid = 0
    paid_persons = $scope.persons.filter (x) ->
      x.paid
    unpaid_persons = $scope.persons.filter (x) ->
      !x.paid
    
    for person in paid_persons
      if person.total < person.paid
        person.change = person.total - person.paid
       else
        person.change = 0
      total_paid += parseFloat(person.paid)

    for person in unpaid_persons
      person.change = ($scope.check.total - total_paid) / unpaid_persons.length

  lockPerson = (person) ->
    person.locked = true
    computePerPerson()

  $scope.add_item = ->
    @.person.items.push {}
    lockPerson(@.person)

  $scope.remove_item = (index) ->
    person = @.person
    person.items.splice(index,1)

    if person.items.length == 0
      person.locked = false
      computePerPerson()

  # Watch Functions
  $scope.$watch('check.number_of_people', computePeople)

  $scope.$watch('check.total + check.gratuity + check.tax', (new_val, old_val) -> computeTotal(new_val, old_val))

  $scope.$watch('persons', computePerPerson, true)

  # Initializers on page load
  computePeople($scope.check.number_of_people, 0)
  computePerPerson()
