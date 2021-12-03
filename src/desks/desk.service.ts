import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CreateDeskDto } from './dto/create-desk.dto';
import { UpdateDeskDto } from './dto/update-desk.dto';

@Injectable()
export class DeskService {
  constructor(private prisma: PrismaService) {}
  create(createDeskDto: CreateDeskDto) {
    return this.prisma.desk.create({
      data: {
        createdAt: new Date(),
        createdBy: 1,
        ...createDeskDto,
      },
    });
  }

  findAll() {
    return this.prisma.desk.findMany({
      where: {
        deletedAt: null,
      },
    });
  }

  findOne(id: number) {
    return this.prisma.desk.findUnique({
      where: {
        id: id,
      },
    });
  }

  update(id: number, updateDeskDto: UpdateDeskDto) {
    return this.prisma.desk.update({
      where: {
        id: id,
      },
      data: updateDeskDto,
    });
  }

  remove(id: number) {
    return this.prisma.desk.update({
      where: {
        id: id,
      },
      data: {
        deletedAt: new Date(),
        deletedBy: 1,
      },
    });
  }
}
