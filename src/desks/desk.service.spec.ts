import { Test, TestingModule } from '@nestjs/testing';
import { DeskService } from './desk.service';

describe('DesksService', () => {
  let service: DeskService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [DeskService],
    }).compile();

    service = module.get<DeskService>(DeskService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
