import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/https.config';
import { IBaseResponse } from '../typeDef/base.type';
import { IProduct } from '../typeDef/product.type';


class ProductService {
  getAll(): Promise<AxiosResponse<IBaseResponse<IProduct[]>>> {
    return httpsNoToken.get('/product')
  }
  search(key: string): Promise<AxiosResponse<IBaseResponse<IProduct[]>>> {
    return httpsNoToken.get(`/product_search?search=${key}`)
  }
  getDetail(id:number): Promise<AxiosResponse<IBaseResponse<IProduct>>> {
    return httpsNoToken.get(`/product/${id}`)
  }
  getByProductGroup(group: number): Promise<AxiosResponse<IBaseResponse<IProduct[]>>> {
    return httpsNoToken.get(`/product_by_group/${group}`)
  }
}

export const productService = new ProductService()
