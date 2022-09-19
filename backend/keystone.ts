/*
Welcome to Keystone! This file is what keystone uses to start the app.

It looks at the default export, and expects a Keystone config object.

You can find all the config options in our docs here: https://keystonejs.com/docs/apis/config
*/

import { config } from '@keystone-6/core';
import type { DatabaseConfig, StorageConfig } from '@keystone-6/core/types';

import dotenv from 'dotenv';
// Look in the schema file for how we define our lists, and how users interact with them through graphql or the Admin UI
import { lists } from './schema';

// Keystone auth is configured separately - check out the basic auth setup we are importing from our auth file.
import { withAuth, session } from './auth';

dotenv.config();

const {
  S3_BUCKET_NAME: bucketName = 'bemeals',
  S3_REGION: region = 'us-east-1',
  S3_ACCESS_KEY_ID: accessKeyId = 'AKIATD5GTIAWVTP5NGOD',
  S3_SECRET_ACCESS_KEY: secretAccessKey = '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'
} = process.env;

export default withAuth(
  // Using the config function helps typescript guide you to the available options.
  config({
    // the db sets the database provider - we're using sqlite for the fastest startup experience
    db: {
      provider: 'postgresql',
      url: 'postgresql://doadmin:AVNS_TWpnKzmej1dNRTQK54l@db-postgresql-sfo3-26085-do-user-3454159-0.b.db.ondigitalocean.com:25060/defaultdb?sslmode=require',
      onConnect: async context => { /* ... */ },
      // Optional advanced configuration
      enableLogging: true,
      useMigrations: true,
      },
    // This config allows us to set up features of the Admin UI https://keystonejs.com/docs/apis/config#ui
    ui: {
      // For our starter, we check that someone has session data before letting them see the Admin UI.
      isAccessAllowed: (context) => !!context.session?.data,
    },
    storage: {
      aws: {
        kind: 's3',
        type: 'image',
        bucketName,
        region,
        accessKeyId,
        secretAccessKey,
        signed: { expiry: 5000 },
      }
    },
    lists,
    session,
  })
);
