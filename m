Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1517EC43334
	for <dmaengine@archiver.kernel.org>; Wed,  8 Jun 2022 00:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1583395AbiFGXqg (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 7 Jun 2022 19:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578298AbiFGXb7 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 7 Jun 2022 19:31:59 -0400
X-Greylist: delayed 17025 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Jun 2022 15:01:55 PDT
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4560B4397F2
        for <dmaengine@vger.kernel.org>; Tue,  7 Jun 2022 15:01:55 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D8D601C0005;
        Tue,  7 Jun 2022 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1654639313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X7H2+f3HHT8tHvJhnJINPeSewzTBgU7o6XQnCNoc+YE=;
        b=bXvg4aRdea7GxsGdqHrZA75XAjWKE29OhlMuNUHNl2KmbOsbJH2PJWODLiWVfCINlUqkIm
        th9atLyNaLkjiYcXW77sKu0VL3B17g0YGZwyTaqY1afYgyDzQxvxtaM2LYfQATOSRiW5QC
        qfO2nw3Z3RAjPjjA0mNT7/JnKLsHhED3T4EKBBlyuHP6bFkSUGBkXDygWk2mHLnMB92u8/
        frHPPxnxM+VUlUVwGKNn/DJt61yAE6WVNeUF7UbZ9m0vGjqVifW7PEpssbfWqkzYv4i+4o
        98BA4HHzQcqHwbFpEq6Ug8/NNN5zS6Z02DYMeARnqKbCaIFaVdQ1cD01np71qA==
Date:   Wed, 8 Jun 2022 00:01:47 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] dmaengine: dw: dmamux: Fix build without
 CONFIG_OF
Message-ID: <20220608000147.23ca1b6b@xps-13>
In-Reply-To: <Yp+d7PFFUBFKXwDm@smile.fi.intel.com>
References: <20220607152215.46731-1-miquel.raynal@bootlin.com>
        <20220607152215.46731-2-miquel.raynal@bootlin.com>
        <Yp99r87N7uyQYvwz@smile.fi.intel.com>
        <20220607191759.7e3a2fcc@xps-13>
        <Yp+d7PFFUBFKXwDm@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Andy,

andriy.shevchenko@linux.intel.com wrote on Tue, 7 Jun 2022 21:50:20
+0300:

> On Tue, Jun 07, 2022 at 07:17:59PM +0200, Miquel Raynal wrote:
> > andriy.shevchenko@linux.intel.com wrote on Tue, 7 Jun 2022 19:32:47
> > +0300: =20
> > > On Tue, Jun 07, 2022 at 05:22:15PM +0200, Miquel Raynal wrote: =20
>=20
> ...
>=20
> > > No, what I asked is the opposite. =20
> >=20
> > I don't get what you want. Can you please explain what you mean by
> > "simply drop CONFIG_OF"? =20
>=20
> The below code changes shouldn't be present in this patch, that's all.

Ok then, I'll send a v3 tomorrow without the below changes + the
missing Fixes.

Thanks for the clarification.

Cheers,
Miqu=C3=A8l

>=20
> ...
>=20
> > > > +#ifdef CONFIG_OF
> > > >  static const struct of_device_id rzn1_dmamux_match[] =3D {
> > > >  	{ .compatible =3D "renesas,rzn1-dmamux" },
> > > >  	{}
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, rzn1_dmamux_match);
> > > > +#endif
> > > > =20
> > > >  static struct platform_driver rzn1_dmamux_driver =3D {
> > > >  	.driver =3D {
> > > >  		.name =3D "renesas,rzn1-dmamux",
> > > > -		.of_match_table =3D rzn1_dmamux_match,
> > > > +		.of_match_table =3D of_match_ptr(rzn1_dmamux_match),
> > > >  	},
> > > >  	.probe	=3D rzn1_dmamux_probe,
> > > >  };   =20
>=20
