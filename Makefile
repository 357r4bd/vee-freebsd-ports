# New ports collection makefile for:	vee
# Date created:		24 April 2007
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $FreeBSD: ports/www/vee/Makefile,v 1.4 2008/09/23 00:47:59 wxs Exp $
#

PORTNAME=	vee
DISTVERSION=	0.9.9-zeta
CATEGORIES=	www
MASTER_SITES=	http://www.0x743.com/vee/ CENKES
# Also here: http://code.google.com/p/vee/
EXTRACT_SUFX=	.tgz

MAINTAINER=	estrabd@gmail.com
COMMENT=	Tiny CLI blogging tool

NO_BUILD=	yes
PLIST_FILES=	bin/${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -Ee 's|^function ([[:graph:]]+)|\1 ()|' ${WRKSRC}/bin/${PORTNAME}

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin/

.include <bsd.port.mk>
