import { describe, expect, it } from 'vitest';
import { readAuthFileConcurrency } from './authFileConcurrency';

describe('readAuthFileConcurrency', () => {
  it('accepts limited and unlimited snapshots and rejects malformed values', () => {
    expect(readAuthFileConcurrency({ concurrency: { current: 2, limit: 5 } })).toEqual({
      current: 2,
      limit: 5,
    });
    expect(readAuthFileConcurrency({ concurrency: { current: 3, limit: null } })).toEqual({
      current: 3,
      limit: null,
    });
    expect(readAuthFileConcurrency({ concurrency: { current: -1, limit: 5 } })).toBeNull();
  });
});
