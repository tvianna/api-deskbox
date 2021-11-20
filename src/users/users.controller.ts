import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { User as UserModel } from '@prisma/client';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  async getAll(): Promise<UserModel[]> {
    return this.usersService.getAll({
      where: { status: 1 },
    });
  }

  @Get('/:id')
  async getById(@Param('id') id: string): Promise<UserModel> {
    return this.usersService.getById({ id: Number(id) });
  }

  @Post()
  async create(
    @Body()
    userData: {
      name: string;
      email: string;
      password: string;
      status: number;
      createdAt: string;
      createdBy: number;
      deletedAt?: string;
      deletedBy?: number;
    },
  ): Promise<UserModel> {
    return this.usersService.create(userData);
  }

  @Put('/:id')
  async update(
    @Body()
    userData: {
      name: string;
      email: string;
      password: string;
      status: number;
      createdAt: string;
      createdBy: number;
      deletedAt?: string;
      deletedBy?: number;
    },
    @Param('id') id: string,
  ): Promise<void> {
    console.log(userData, id);
    // await this.usersService.update();
  }

  @Delete('/:id')
  async remove(@Param('id') id: string): Promise<void> {
    await this.usersService.remove({ id: Number(id) });
  }
}
