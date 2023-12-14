import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/https.config';
import { IBaseResponse } from '../typeDef/base.type';


class PaymentService {
  new(body: {userId: number, address: string, note?: string, type: number, total: number}): Promise<AxiosResponse<IBaseResponse<any>>> {
    return httpsNoToken.post('/new_payment', body)
  }
  paymentVnpay(body: {orderId: string, total: number}): Promise<AxiosResponse<IBaseResponse<any>>> {
    return httpsNoToken.post(`/vna_pay`, body)
  }
}

export const paymentService = new PaymentService()
