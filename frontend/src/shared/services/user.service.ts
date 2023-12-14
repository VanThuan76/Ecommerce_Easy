import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/https.config';
import { IUser } from '../typeDef/user.type';
import { IBaseResponse } from '../typeDef/base.type';


class UserService {
    getDetail(id: number): Promise<AxiosResponse<IBaseResponse<IUser>>> {
        return httpsNoToken.get(`/user/${id}`)
    }
}

export const userService = new UserService()