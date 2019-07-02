Return-Path: <SRS0=ihCo=U7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28FEC06510
	for <dmaengine@archiver.kernel.org>; Tue,  2 Jul 2019 14:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7C0B21721
	for <dmaengine@archiver.kernel.org>; Tue,  2 Jul 2019 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562079366;
	bh=Ia0o2q7ZnHa93WlCfPd3K651NhPC/AsEF9x5Wn0U0Nk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=IIq3KO1lmX4V4i4PBsqBmQinfUuQohl7gfDwqz5ou3nWUMfjlYTvPharzygVAwogs
	 HKKpfk5XF17O3zSZvt+yrTlt3BRQAJ932hwLHrYAidMKbS7jOxhFBD1cPjPvA+j6AQ
	 LJw8qdzmlTLkINFWE2X+Isv8tT5bXMUUVOLR/VDw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfGBO4G (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 2 Jul 2019 10:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbfGBO4G (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 2 Jul 2019 10:56:06 -0400
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B2EB21848
        for <dmaengine@vger.kernel.org>; Tue,  2 Jul 2019 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562079365;
        bh=Ia0o2q7ZnHa93WlCfPd3K651NhPC/AsEF9x5Wn0U0Nk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=z874ANHcvdEh6zBTASkB+WECo5mOcXlzWy9YMedAuXikRyyG34Y3punJ15Tg/Rx2i
         lQfYsL3b459aj7j5pKoFFilkFzqseRxhXTHk/9Op4YPDbTBbskmF5sSoea1jI7Q3+C
         t6Vip9R7u+yFoSAzLByHntQOQUl2n5Y6tiE70iKo=
Received: by mail-lf1-f42.google.com with SMTP id d11so11636089lfb.4
        for <dmaengine@vger.kernel.org>; Tue, 02 Jul 2019 07:56:05 -0700 (PDT)
X-Gm-Message-State: APjAAAWjxaop08CxgI+F3a9veOZWnU+6KYS9v58Fcc9S8NEmaYYcVScH
        HZYt7QUQDzCta956z09xKxOsPbwjIgDV51ohMq0=
X-Google-Smtp-Source: APXvYqwRmy3M7/jSq6LfZnbcC10FAjrKWsa6DsReA2AfojWzgwq93gvFyQcPlUmAke0V2bjya3P6kjzlMule73XN4D0=
X-Received: by 2002:a19:4f50:: with SMTP id a16mr13230646lfk.24.1562079363525;
 Tue, 02 Jul 2019 07:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190702143012.9472-1-festevam@gmail.com>
In-Reply-To: <20190702143012.9472-1-festevam@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 2 Jul 2019 16:55:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc5jsfcPB9_-qMNZBAKMqU0TdpScmv-Md3455grAN8NiA@mail.gmail.com>
Message-ID: <CAJKOXPc5jsfcPB9_-qMNZBAKMqU0TdpScmv-Md3455grAN8NiA@mail.gmail.com>
Subject: Re: [PATCH] Revert "dmaengine: fsl-edma: support little endian for
 edma driver"
To:     Fabio Estevam <festevam@gmail.com>
Cc:     vkoul@kernel.org, peng.ma@nxp.com, dmaengine@vger.kernel.org,
        cphealy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Tue, 2 Jul 2019 at 16:30, Fabio Estevam <festevam@gmail.com> wrote:
>
> This reverts commit 002905eca5bedab08bafd9e325bbbb41670c7712.
>
> Commit 002905eca5be ("dmaengine: fsl-edma: support little endian for edma
> driver") incorrectly assumed that there was not little endian support
> in the driver.
>
> This causes hangs on Vybrid, so revert it so that Vybrid systems
> could boot again.
>
> Reported-by: Krzysztof Koz=C5=82owski <k.kozlowski.k@gmail.com>

Thanks for the credits, just minor fixup (I used wrong email):
Reported-by: Krzysztof Kozlowski <krzk@kernel.org>

Also:
Tested-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/dma/fsl-edma-common.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.=
c
> index 6bf238e19d91..680b2a00a953 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -83,14 +83,9 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
>         u32 ch =3D fsl_chan->vchan.chan.chan_id;
>         void __iomem *muxaddr;
>         unsigned int chans_per_mux, ch_off;
> -       int endian_diff[4] =3D {3, 1, -1, -3};
>
>         chans_per_mux =3D fsl_chan->edma->n_chans / DMAMUX_NR;
>         ch_off =3D fsl_chan->vchan.chan.chan_id % chans_per_mux;
> -
> -       if (!fsl_chan->edma->big_endian)
> -               ch_off +=3D endian_diff[ch_off % 4];
> -
>         muxaddr =3D fsl_chan->edma->muxbase[ch / chans_per_mux];
>         slot =3D EDMAMUX_CHCFG_SOURCE(slot);
>
> --
> 2.17.1
>
