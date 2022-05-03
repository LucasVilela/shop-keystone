import { config } from '@keystone-6/core';
import { lists } from './schema';
import { withAuth, session } from './auth';

export default withAuth(
  config({
    db: {
      provider: 'postgresql',
      url:
        process.env.DATABASE_URL ||
        'postgres://postgres:mysecretpassword@localhost:55000',
      useMigrations: true,
    },
    ui: {
      isAccessAllowed: (context) => !!context.session?.data.isAdmin,
    },
    lists,
    session,
  })
);
