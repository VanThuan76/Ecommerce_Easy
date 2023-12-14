import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/https.config';
import { IBaseResponse } from '../typeDef/base.type';
import { IProductGroup } from '../typeDef/productGroup.type';


class ProductGroupService {
  getAll(): Promise<AxiosResponse<IBaseResponse<IProductGroup[]>>> {
    return httpsNoToken.get('/product_group')
  }
}

export const productGroupService = new ProductGroupService()
