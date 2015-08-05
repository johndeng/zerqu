# coding: utf-8


def register_base(app):
    from .models import db, social, auth
    from .libs.pigeon import mail
    from .libs import cache, ratelimit

    db.init_app(app)
    social.init_app(app)
    auth.bind_oauth(app)
    cache.init_app(app)
    mail.init_app(app)
    ratelimit.init_app(app)


def register_base_blueprints(app):
    from .handlers import session, oauth, account

    from .api import init_app
    init_app(app)

    app.register_blueprint(oauth.bp, url_prefix='/oauth')
    app.register_blueprint(session.bp, url_prefix='/session')
    app.register_blueprint(account.bp, url_prefix='/account')


def register_app_blueprints(app):
    from .handlers import front, feeds

    app.register_blueprint(feeds.bp, url_prefix='')
    app.register_blueprint(front.bp, url_prefix='')


def create_app(config=None):
    from .app import create_app
    app = create_app(config)
    register_base(app)
    register_base_blueprints(app)
    register_app_blueprints(app)
    return app
