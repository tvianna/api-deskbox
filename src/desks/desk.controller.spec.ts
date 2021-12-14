import { Test, TestingModule } from '@nestjs/testing';
import { DeskController } from './desk.controller';
import { DeskService } from './desk.service';

describe('DeskController', () => {
  let controller: DeskController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DeskController],
      providers: [DeskService],
    }).compile();

    controller = module.get<DeskController>(DeskController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
