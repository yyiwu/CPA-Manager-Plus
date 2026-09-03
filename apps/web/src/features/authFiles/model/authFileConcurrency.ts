import type { AuthFileConcurrency, AuthFileItem } from '@/types/authFile';

export const readAuthFileConcurrency = (
  file: Pick<AuthFileItem, 'concurrency'>
): AuthFileConcurrency | null => {
  const current = file.concurrency?.current;
  const limit = file.concurrency?.limit;
  if (!Number.isInteger(current) || (current ?? -1) < 0) return null;
  if (limit !== null && (!Number.isInteger(limit) || (limit ?? 0) <= 0)) return null;
  return { current: current as number, limit: limit as number | null };
};
