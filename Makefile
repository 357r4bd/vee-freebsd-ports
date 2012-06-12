# New ports collection makefile for:	vee
# Date created:		24 April 2007
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $FreeBSD: ports/www/vee/Makefile,v 1.4 2008/09/23 00:47:59 wxs Exp $
#

PORTNAME=	vee
DISTVERSION=	1.0_RC
CATEGORIES=	www
MASTER_SITES=	http://www.0x743.com/vee/ CENKES
# Also here: http://code.google.com/p/vee/
EXTRACT_SUFX=	.tgz

MAINTAINER=	estrabd@gmail.com
COMMENT=	Tiny CLI blogging tool

LICENSE=	BSD

NO_BUILD=	yes
PLIST_FILES=	bin/${PORTNAME}

MAN1=	vee.1 veels.1 veecat.1 vee-reindex.1

post-patch:
	@${REINPLACE_CMD} -Ee 's|^function ([[:graph:]]+)|\1 ()|' ${WRKSRC}/bin/${PORTNAME}

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/man/vee.1 ${MAN1PREFIX}/man/man1/vee.1
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/veels ${PREFIX}/bin/veels
	@${INSTALL_MAN} ${WRKSRC}/man/veels.1 ${MAN1PREFIX}/man/man1/veels.1
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/veecat ${PREFIX}/bin/veecat
	@${INSTALL_MAN} ${WRKSRC}/man/veecat.1 ${MAN1PREFIX}/man/man1/veecat.1
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/vee-reindex ${PREFIX}/bin/vee-reindex
	@${INSTALL_MAN} ${WRKSRC}/man/vee-reindex.1 ${MAN1PREFIX}/man/man1/vee-reindex.1

.include <bsd.port.mk>
