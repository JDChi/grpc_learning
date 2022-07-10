import 'package:flutter_grpc/protos/generated/ecommerce/product_info.pbgrpc.dart';
import 'package:grpc/grpc.dart';

abstract class IProductService {
  Future<ProductId> addProduct({required Product product});

  Future<Product> getProduct({required ProductId productId});
}

class ProductService implements IProductService {
  late ClientChannel _productChannel;
  late ProductInfoClient _productInfoClient;

  ProductService() {
    _productChannel = ClientChannel('127.0.0.1');
    _productInfoClient = ProductInfoClient(_productChannel);
  }

  @override
  Future<ProductId> addProduct({required Product product}) async {
    final resp = await _productInfoClient.addProduct(product);
    return resp;
  }

  @override
  Future<Product> getProduct({required ProductId productId}) async {
    final resp = await _productInfoClient.getProduct(productId);
    return resp;
  }
}
