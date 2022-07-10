///
//  Generated code. Do not modify.
//  source: ecommerce/product_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'product_info.pb.dart' as $0;
export 'product_info.pb.dart';

class ProductInfoClient extends $grpc.Client {
  static final _$addProduct = $grpc.ClientMethod<$0.Product, $0.ProductId>(
      '/ecommerce.ProductInfo/addProduct',
      ($0.Product value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProductId.fromBuffer(value));
  static final _$getProduct = $grpc.ClientMethod<$0.ProductId, $0.Product>(
      '/ecommerce.ProductInfo/getProduct',
      ($0.ProductId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Product.fromBuffer(value));

  ProductInfoClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ProductId> addProduct($0.Product request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.Product> getProduct($0.ProductId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProduct, request, options: options);
  }
}

abstract class ProductInfoServiceBase extends $grpc.Service {
  $core.String get $name => 'ecommerce.ProductInfo';

  ProductInfoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Product, $0.ProductId>(
        'addProduct',
        addProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Product.fromBuffer(value),
        ($0.ProductId value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProductId, $0.Product>(
        'getProduct',
        getProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProductId.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
  }

  $async.Future<$0.ProductId> addProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Product> request) async {
    return addProduct(call, await request);
  }

  $async.Future<$0.Product> getProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProductId> request) async {
    return getProduct(call, await request);
  }

  $async.Future<$0.ProductId> addProduct(
      $grpc.ServiceCall call, $0.Product request);
  $async.Future<$0.Product> getProduct(
      $grpc.ServiceCall call, $0.ProductId request);
}
