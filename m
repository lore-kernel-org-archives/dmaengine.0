Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC90C433EF
	for <dmaengine@archiver.kernel.org>; Tue,  7 Jun 2022 17:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345508AbiFGRSR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 7 Jun 2022 13:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345516AbiFGRSP (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 7 Jun 2022 13:18:15 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD98687206
        for <dmaengine@vger.kernel.org>; Tue,  7 Jun 2022 10:18:12 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 775EE240002;
        Tue,  7 Jun 2022 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1654622289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oX6STfn6AGRLMpPXJAcHG6psTGAugxQDl1TeGLQvDVY=;
        b=WJTTPol7F1m1fRSxsebHoDlr5W1gSZv9ttE/p9IXSNDA+hFn8du5c3fk0zGKxuM7iT/P7z
        L9cjox3mPbzcTI0GTW9c8ro/U2mSJDLhcd88QOwVAeT6u02eH4gDqLvjj0dEdDWYBdcJ6/
        fESyl11/bqAWl+etUIJvF5pM9mL639T864WEazHt0NV5al348tGoa8wdRZJJh/aqY+O9qj
        TpCt5AjJZmwdxJ7r9pSafuQGS/x88GHd3WSJXIi30tcqztSG6WhPBbHOD8L6zPALVi1pnK
        GJL4XDqhNR3owJMdI/rckxucRyGSNhbbgVMV0Z/pvvYWZOSzdtHyYZki9VAdEQ==
Date:   Tue, 7 Jun 2022 19:17:59 +0200
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
Message-ID: <20220607191759.7e3a2fcc@xps-13>
In-Reply-To: <Yp99r87N7uyQYvwz@smile.fi.intel.com>
References: <20220607152215.46731-1-miquel.raynal@bootlin.com>
        <20220607152215.46731-2-miquel.raynal@bootlin.com>
        <Yp99r87N7uyQYvwz@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Andy,

andriy.shevchenko@linux.intel.com wrote on Tue, 7 Jun 2022 19:32:47
+0300:

> On Tue, Jun 07, 2022 at 05:22:15PM +0200, Miquel Raynal wrote:
> > When built without OF support, of_match_node() expands to NULL, which
> > produces the following output: =20
> > >> drivers/dma/dw/rzn1-dmamux.c:105:34: warning: unused variable 'rzn1_=
dmac_match' [-Wunused-const-variable] =20
> >    static const struct of_device_id rzn1_dmac_match[] =3D {
> >=20
> > One way to silence the warning is to enclose the structure definition
> > with an #ifdef CONFIG_OF/#endif block.
> >=20
> > In order to keep the harmony in the driver, the second match table is
> > also enclosed with the same #ifdef CONFIG_OF/#endif block and the use of
> > the match table forwarded by the of_match_ptr() macro. =20
>=20
> No, what I asked is the opposite.

I don't get what you want. Can you please explain what you mean by
"simply drop CONFIG_OF"?

> So, the most of this patch seems not needed (see below).
>=20
> ...
>=20
> > +#ifdef CONFIG_OF
> >  static const struct of_device_id rzn1_dmamux_match[] =3D {
> >  	{ .compatible =3D "renesas,rzn1-dmamux" },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, rzn1_dmamux_match);
> > +#endif
> > =20
> >  static struct platform_driver rzn1_dmamux_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "renesas,rzn1-dmamux",
> > -		.of_match_table =3D rzn1_dmamux_match,
> > +		.of_match_table =3D of_match_ptr(rzn1_dmamux_match),
> >  	},
> >  	.probe	=3D rzn1_dmamux_probe,
> >  }; =20
>=20


Thanks,
Miqu=C3=A8l
