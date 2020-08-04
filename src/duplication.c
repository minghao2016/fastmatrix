/* $ID: duplication.c, last updated 2020-08-03, F.Osorio */

#include "base.h"
#include "duplication.h"

void
duplication_mat(int *x, int *ldx, int *n, int *col)
{ /* creates the duplication matrix of order 'n' */
  int nrow = SQR(*n), pos;

  for (int i = 0; i < nrow; i++) {
    pos = col[i] - 1; /* index correction */
    x[i + pos * *ldx] = 1;
  }
}

void
dupl_left_mult(double *a, int *lda, int *arow, int *acol, int *col, int *n, double *b, int *ldb)
{
  int nrow = SQR(*n), ncol = *n * (*n + 1) / 2, pos;

  if (*arow != ncol)
    return;

  for (int j = 0; j < *acol; j++) {
    for (int i = 0; i < nrow; i++) {
      pos = col[i] - 1; /* index correction */
      b[i + j * *ldb] = a[pos + j * *lda];
    }
  }
}

void
dupl_left_trans(double *a, int *lda, int *arow, int *acol, int *col, int *n, int *counts, double *b, int *ldb)
{
  int nrow = *n * (*n + 1) / 2, ncol = SQR(*n), pos1, pos2, k;

  if (*arow != ncol)
    return;

  for (int j = 0; j < *acol; j++) {
    k = 0;
    for (int i = 0; i < nrow; i++) {
      if (counts[i] < 2) {
        pos1 = col[k] - 1; /* index correction */
        b[i + j * *ldb] = a[pos1 + j * *lda];
        k++;
      } else {
        pos1 = col[k] - 1; /* index correction */
        pos2 = col[k + 1] - 1; /* index correction */
        b[i + j * *ldb] = a[pos1 + j * *lda] + a[pos2 + j * *lda];
        k += 2;
      }
    }
  }
}