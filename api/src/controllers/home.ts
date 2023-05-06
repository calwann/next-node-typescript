import { Request, Response } from 'express'

/**
 * @route GET /
 * @param req
 * @param res
 */
export const index = (req: Request, res: Response): void => {
  res.status(200).json({
    isWorking: true
  })
}
