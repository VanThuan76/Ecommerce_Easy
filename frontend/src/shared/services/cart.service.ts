import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/https.config';
import { IBaseResponse } from '../typeDef/base.type';
import { ICart, IStoreCart } from '../typeDef/cart.type';

class CartService {
  new(body: ICart): Promise<AxiosResponse<IBaseResponse<null>>> {
    return httpsNoToken.post('/new_cart', body)
  }
  update(body: ICart): Promise<AxiosResponse<IBaseResponse<null>>> {
    return httpsNoToken.put('/update_cart', body)
  }
  delete(id: number): Promise<AxiosResponse<IBaseResponse<null>>> {
    return httpsNoToken.delete(`/delete_cart/${id}`)
  }
  listByUser(userId: number): Promise<AxiosResponse<IBaseResponse<IStoreCart[]>>> {
    return httpsNoToken.get(`/list_cart/${userId}`)
  }
}

export const cartService = new CartService()