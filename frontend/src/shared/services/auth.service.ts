import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/https.config';
import { IAccount } from '../typeDef/user.type';
import { IBaseResponse } from '../typeDef/base.type';


class AuthService {
  login(body: { email: string; password: string }): Promise<AxiosResponse<IBaseResponse<IAccount>>> {
    return httpsNoToken.post('/login', body)
  }
  register(body: { name: string; email: string, password: string, password_confirmation: string }): Promise<AxiosResponse<IBaseResponse<IAccount>>> {
    return httpsNoToken.post('/register', body)
  }
}

export const authService = new AuthService()