import { Module } from '@nestjs/common';
import { DeskService } from './desk.service';
import { DeskController } from './desk.controller';
import { PrismaService } from '../prisma.service';

@Module({
  imports: [],
  controllers: [DeskController],
  providers: [DeskService, PrismaService],
})
export class DeskModule {}
