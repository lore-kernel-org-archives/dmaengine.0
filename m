Return-Path: <SRS0=gq6v=S6=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EB1C43219
	for <dmaengine@archiver.kernel.org>; Sun, 28 Apr 2019 06:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C21AD21473
	for <dmaengine@archiver.kernel.org>; Sun, 28 Apr 2019 06:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556432767;
	bh=9B//KzvFa5dLXrKGQMUwCgfLmhWJGugeVFX6eHGEn8E=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=g900IJRj2dKvRUChD00IvXMfSHcGIxrRtHNzZ+gu/2qb1ad18+Qf/TdzbmcoVHG5J
	 ttxHEUcRHww1GB8rMsZIp2qiMgKkv/5xJD0H9GwHdFmPL962xqZ5VUPEn0f44lt7Gv
	 ERU38pgtUfyFVBoLM0bG6rwoFO+df4pZRpGUDjUs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfD1G0H (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 28 Apr 2019 02:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfD1G0H (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 28 Apr 2019 02:26:07 -0400
Received: from localhost (unknown [49.207.57.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6614A21473;
        Sun, 28 Apr 2019 06:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556432766;
        bh=9B//KzvFa5dLXrKGQMUwCgfLmhWJGugeVFX6eHGEn8E=;
        h=Date:From:To:Cc:Subject:From;
        b=cDRxOZocI6Zm7lfT1KLlh64juaFy/DE49hVfbGOd337TlNRjJxOTYP2JW04MM/sO4
         OdWKbsEyecgoc0WYz3cRH9yNGRGpCWKtMzUMabSa/qEPbafLFZDUXEyPCIDx/WA6Rc
         fnqHTYExp1O52JZPWs9KAraUCti7zZM+7I29M33w=
Date:   Sun, 28 Apr 2019 11:56:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dma <dmaengine@vger.kernel.org>
Subject: [GIT PULL]: late dmaengine fixes for v5.1-rc7
Message-ID: <20190428062602.GA3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Here is the late pull request for v5.1-rc7
Please consider pulling to receive:

The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/vkoul/slave-dma.git tags/dmaengine-fix-5.1-=
rc7

for you to fetch changes up to 5bb5c3a3ac102158b799bf5eda871223aa5e9c25:

  dmaengine: mediatek-cqdma: fix wrong register usage in mtk_cqdma_start (2=
019-04-26 17:26:38 +0530)

----------------------------------------------------------------
dmaengine-fix-5.1-rc7

dmaengine fixes for v5.1-rc7

 - fix for wrong register use in mediatek driver
 - fix in sh driver for glitch is tx_status and treating 0 a valid
   reside for cyclic
 - fix in bcm driver for using right memory allocation flag

----------------------------------------------------------------
Achim Dahlhoff (1):
      dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status

Dirk Behme (1):
      dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid

Shun-Chih Yu (1):
      dmaengine: mediatek-cqdma: fix wrong register usage in mtk_cqdma_start

Stefan Wahren (1):
      dmaengine: bcm2835: Avoid GFP_KERNEL in device_prep_slave_sg

 drivers/dma/bcm2835-dma.c        |  2 +-
 drivers/dma/mediatek/mtk-cqdma.c |  2 +-
 drivers/dma/sh/rcar-dmac.c       | 30 ++++++++++++++++++++++++++----
 3 files changed, 28 insertions(+), 6 deletions(-)

Thanks
--=20
~Vinod

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcxUd6AAoJEHwUBw8lI4NHFj0P/35fn0uxuPom/Od6lLFqzqHD
rWOS1w54wshpft7m6LwbGbeaZ40o38QeMft3DZNbkmUPD24ho0SYxjQxlm53+zbT
AKSfqEj//jzkhY//xw5uJVnbAHPXZGJbSMLIuh3p9p0eJuwWAHxhj5xlLHlDb+uC
NPoWbB3P07cMbifz9bvZcTlCuyP/+OPfjarenkP0E72egiCdOYFK0FDnmGYVG4jV
8r/2THKUZuUSJ9cn51a/CDBm1dntjHRrWL2C+EIHUb6UirUYqqHkRbT+IVSzGcLt
sVIMr8c4FiqNNaPWTs7+khhMQNYxssY4IIcbp/f/9w2IIE0WULgiYKVv+iMl4m4K
0O+Q+Pzjh97RNrhF2AgMLJF5t8kTLKg5hl/M+Dvcxv0zL/iNYDu1ylhe5N1aMArY
OP16Obr2zRzkq3O1Y5dTJL5k85xMPw1EUDyK6VDMQAQDnE/+zKcqVVcGSc8bCjFF
6NklW4sRT7PXIzsjAhdnuSkbaS8RIpLI7iBCISriIjGftF8GW1sTdH8u8I786hfW
1mKBXM6byCJEA9FlR6PQR5bm31ZDVQMIRdO3IciZA72AURTdRMY9nMAxI6EKf9Bt
4jHYBfkSUxjAQVz9n6vaewIDCZec997UlcXl7XuVr8gwTTJ9u4g97oWbTkgRSqSU
36HUDlsF0yCONDdnh3kb
=DNb9
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
