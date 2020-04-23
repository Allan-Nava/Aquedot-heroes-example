/** 
*  channel.dart
*  heroes_app 2020-04-23
*  heroes_app 2020-04-23
*
*  Created by [Allan Nava].
*  Updated by [Allan Nava]
*  Copyright © 2020 [Allan Nava]. All rights reserved.
*/
import 'heroes.dart';
///
import 'controller/heroes_controller.dart';
///
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }
  ///
  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    //
    router
      //.route('/heroes')
      .route('/heroes/[:id]') // added id filter
      .link(() => HeroesController());
    ///
    /*
    
      Each of these objects is a subclass of Controller, giving them the ability to be linked together to handle requests. A request goes through controllers in the order they are linked. A request for the path /users will go through an APIKeyValidator, an Authorizer and finally a UsersController. Each of these controllers has an opportunity to respond, preventing the next controller from receiving the request.∑
    
    */
    //router
    //  .route('/users')
    //  .link(() => APIKeyValidator())
    //  .link(() => Authorizer.bearer())
    //  .link(() => UsersController());
    ///
    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    return router;
  }
  ///
}
///
