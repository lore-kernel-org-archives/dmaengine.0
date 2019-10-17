Return-Path: <SRS0=WKqD=YK=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D32CFA372A
	for <dmaengine@archiver.kernel.org>; Thu, 17 Oct 2019 11:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D036021835
	for <dmaengine@archiver.kernel.org>; Thu, 17 Oct 2019 11:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxL1FETt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405990AbfJQLaf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 17 Oct 2019 07:30:35 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36631 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405941AbfJQLaf (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 17 Oct 2019 07:30:35 -0400
Received: by mail-ed1-f68.google.com with SMTP id h2so1460196edn.3
        for <dmaengine@vger.kernel.org>; Thu, 17 Oct 2019 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xOUnKgMCGvJAUS6ZmiNycMfRjAPWUKvG/ScZda78+rE=;
        b=YxL1FETtHlQHtaMhDaZE+71PQ4/7AGbOHQq4QSq/n4THHpMgTH8KjFhEgEc31MBRSH
         PhOhR3eucYV6Wv1QLau4+vcNh6FlYwI9CdlqYjyFDdtTroBHB0RUeqh84lU04fLADi4H
         Le7M4ECQGFRBhvS09UF9WS1pmP+37BmFO2rUdJsEWcbXOWzRYEk2E3x5K6z+WssWBkdn
         gSq+pTGgWlpwqkP7bpjPpzxgzNpjC2DC76O8v8crP2/jOeSP43iVOXpfKnczw9XfpyJu
         mGFhVovdVCn555iDdkRxoTKomSzAnhAnC1Wk3fnPdlBOy2oTcK1ZIFuXysOdEtwP4aaw
         sViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xOUnKgMCGvJAUS6ZmiNycMfRjAPWUKvG/ScZda78+rE=;
        b=ZuuJl35bkIEGd3ihb40lNaDoCRD8lFiNRuDXrn0IwILAhSuYMMpnNjC57+0elQYa5O
         nzHYH5QqOwfo/dkZWX5ekdiMtRSy7t7EFdIt2w+ZGZjTQhcXG1FJU0wOSF51HIAJ/IBK
         K0rYrE1q2xM5ZHNoi7/5o6iZDcaFA3/0igfUrT3qx1D6m8m+tss34NJ+Vz/BAdAliAqZ
         OVBENJxWMXYfqrALMSAYKLZ8qun+WyUFzB8b0ZjHHPfrBO5tGiq7vLjv8KOM97jjFg78
         w3yrAxuf2z+ko5YiCzHqXeBo0tT9yGBGIuh17vk9zDy30jLNP/0LHuBOvly08zQuTxwB
         QE1A==
X-Gm-Message-State: APjAAAVAulXmuzLIxBpv+uGEPTIBTpkhsGh3RyDwTx3fKrXFwW87H8lA
        Yc4EvV0ezfvmqUnZDBTYJt8YdCxGSQyZmjiXOsc=
X-Google-Smtp-Source: APXvYqz0BCequpqQtk3DLEXB4V3hf6VDFbhGpCB0CFvhsKBkDICNIKHulUg3eB1NY3Cbq4CLBW50if5yTfzGO5PYuOQ=
X-Received: by 2002:a50:98c6:: with SMTP id j64mr3145971edb.295.1571311832243;
 Thu, 17 Oct 2019 04:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAH+2xPB7rbeJnOPU10Ss9BhV_2DJV-ToQ3XNOy97+vrGx+ubcg@mail.gmail.com>
 <20191014141344.uwnzy3j3kxngzv7a@pengutronix.de>
In-Reply-To: <20191014141344.uwnzy3j3kxngzv7a@pengutronix.de>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 17 Oct 2019 13:30:16 +0200
Message-ID: <CAH+2xPCLr4B-=Z=Rf9NryF6wU2yLLYhFpNNZ6QBtKP8KEW_FTA@mail.gmail.com>
Subject: Re: Regression: dmaengine: imx28 with emmc
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
        vkoul@kernel.org, miquel.raynal@bootlin.com, bth@kamstrup.com,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Sascha,

Den man. 14. okt. 2019 kl. 16.13 skrev Sascha Hauer <s.hauer@pengutronix.de>:
>
> > I am getting a kernel oops[1] during boot on imx28 with emmc flash right
> > around rootfs mounting. Using git bisect I found the cause to be the
> > following commit.
> >
> > Regression: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
>
> Damn, I wasn't aware the DMA driver has other users than the GPMI Nand.
> Please try the attached patch, it should fix it for MMC/SD. It seems
> however, that I2C and AUART and SPI are also affected. Are you able to
> test any of these?

Thanks for looking into the reported issue.

I have tested your patch and it works. Rootfs is now successfully
mounted during boot and it seems to work in user-land as well.

Yes, our hardware uses I2C, AUARTs and SPI as well so I can test more patches.
I have not seen them produce kernel oops or errors, so maybe they
fallback to non-DMA mode.

> Subject: [PATCH] mmc: mxs: fix flags passed to dmaengine_prep_slave_sg
>
> Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reported-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Tested-by: Bruno Thomsen <bruno.thomsen@gmail.com>

/Bruno
