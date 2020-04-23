/** 
*  heroes_controller.dart
*  heroes_app 2020-04-23
*  heroes_app 2020-04-23
*
*  Created by [Allan Nava].
*  Updated by [Allan Nava]
*  Copyright © 2020 [Allan Nava]. All rights reserved.
*/
import 'package:aqueduct/aqueduct.dart';
///
import 'package:heroes/heroes.dart';
///
class HeroesController extends Controller {
  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},    
  ];
  // In just a moment, we'll replace this code with something even better,
  // but it's important to understand where this information comes from first!
  @override
  Future<RequestOrResponse> handle(Request request) async {
    if (request.path.variables.containsKey('id')) {
    final id = int.parse(request.path.variables['id']);
    final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
    if (hero == null) {
      return Response.notFound();
    }

    return Response.ok(hero);
  }
    return Response.ok(_heroes);
  }
  
  @Operation.get()
  Future<Response> getAllHeroes() async {
    return Response.ok(_heroes);
  }
  
  @Operation.get('id')
  Future<Response> getHeroByID() async {
    final id = int.parse(request.path.variables['id']);
    final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
    if (hero == null) {
      return Response.notFound();
    }

    return Response.ok(hero);
  }
}
///
