import { Module } from '@nestjs/common';
import { DeskModule } from './desks/desk.module';
import { UserModule } from './users/user.module';

@Module({
  imports: [DeskModule, UserModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
