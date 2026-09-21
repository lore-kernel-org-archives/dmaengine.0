Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7B48EC7B
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989382; cv=pass; b=n3sNbAW4K+f7PVPYG91UHhkBXWLajVOxc9Lpup30mwgLvdapG1Ebt/UnBQdWS2VBItIkSFYy9yBO3sPUIcqp69D7WynocFciWluQ14hQ6lIWeSA1JEkSN5PDvfSBkX64qoCOW3HSz7/W1E2lrFatMixAdbqEnjoXRyTorLjoavE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989382; c=relaxed/simple;
	bh=UY27w1Rfg6xCtMs7QTO53sEOpBKzcS6nCTvac4TS40A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTRtbIA9WEcDwFF6f3sOZk1yi/eM1AQtfOV0xE7IuCoOFVl9HSKd6PJSrXFgmuLedAuesWSiaWpFC0Bi7V/ioi+IeodzS533abFSnVo3BcY/Jj9npdz4yNRxVnwAMe8M4qSpRyw/LjEgoevrmJ92vWpE8e6Xz64Zkk7jV38czfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSdI+FYs; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSdI+FYs"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso2435237d50.3
        for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 04:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989379; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXhO+/MjzeHwet97UYINFGdBRuKESabtk+zi6qwQw4jalxMO8WhIVUIQOS58jlNr/n
         YXQ9T1LByyQ/46VRBOsP1kMxoktMHUWXuGwa3lltlEKAFpFV9bkb4sjrOP1go0FBGoSK
         HZ75Qp+vUT4Tap/z/Ll6nM3y+kxhcK3poEUK4c7an9PTZbQZ2MS72B+3agcUBnxF6EB1
         aZ+XReVboDX1666PjCNHLhb7n1YTu2AG36bFyviVDwAPaQ23uDibQZm3SmpD/x3meER1
         TqVE0HSxdjQKNAlF0t7iPLmAqUUxmmJNhseVxtfG8ZvWvoV2lhVf+klrW2Zce8cC2Ag4
         HBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOZGG9rQS4x6RO0sAzFbkNSMIY91sIYWznb6POPYtaM=;
        fh=Bw2Pvgqbv0V3Y4bBVptCRFKsmkIRqUUpQVetQkK3DLA=;
        b=WRakygVGuMcHCRz9sZv2T7DVlybRmTo1PCZXvSsJFi3ZtK1IBAjB2uM5mG7gW0ZHkS
         oVGcH+eQUaBt+3gKfmG2gWi/2ir51CZzvgMzlbgjBwBr9PwG/lnA2uZxTBgcoDY4ebHQ
         aWHjoWzx1lI0lZdRhddWZsNXftHcAELVwnQSnc1db4Z+3irlNnbkrbP054SJWhotGbXr
         Sz7BCuERsnihmOnKhpTg0wTI5CVDtQIPWCEhDrFbTw4Pnpln9jvZYayDSZ/M/tXsU9dO
         X27EIB4bQzt2Si59hCEX9sxP6Txkb0kcMi2qPi7ug0JVB9l3r0rME0Jsutl6ztYN/fqA
         n8/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989379; x=1790594179; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOZGG9rQS4x6RO0sAzFbkNSMIY91sIYWznb6POPYtaM=;
        b=hSdI+FYsDeu6UasZMF5RDReUq7JWGuq3otRkujWb6JLFMDEjm8ireuFceohum0h0uJ
         VQEjyp9lPc0C81/aeF/w+QVzbZiF3esQpfF1rDs/7Z+cAfqITqj0iJbqtcV9xlZw3xRj
         N8aDF20fNmOBCQEO7/8B2rbelnKNWBx/hwHNR8Id6QDIz7vsqXQOUN/u5jw9vkYIJ6fs
         1zOZhXYMmJM4thxlNzFMLlyOla9g9lqrihXX9jg/7HQ1bwdIbOefrCR6KjgbwsnIQpXm
         6UzK7I4XVnfaw6mfZ/Q8iILOu2rpjSsnXBu62BaH8jmkKpo3g1JZ/tHUM4bRyRmWhAHz
         a/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989379; x=1790594179;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOZGG9rQS4x6RO0sAzFbkNSMIY91sIYWznb6POPYtaM=;
        b=044oPOpnEuDS3pyRu/CyRPY8vd4bBAYSvXo0xSZg7HW9wX7CfsKB7ErN5J9qBOdSoU
         6zQkGd//b9+NBU1hqIJpE4YW2WnSp3h3+YRvwUdHqXERMAbJFsq1SdljvZuSP4VO+aMp
         RHiq3WYAf7NbFVPY0TwmcIqt4utzEe1jpmaAonSxLR0Y0hNhWJRadna9iejQoBWlIxUG
         C0r3nHyNHm94bgQpUqISBPI+rMxRRt7L4ymcr4f1MiI55GisS7AThiSgillk4aNHGu9A
         tJtHfVClVymw4WuJurax82BwQ6aWzCIE6m24ySJlMpkX581Wo/vT5flDRJc9p5sUvRn7
         0t9Q==
X-Forwarded-Encrypted: i=1; AKwUvByxg7doXOnz9/zdfCGpo+U4++WbI4oNBbI8c6cZAmZsUMSM3SqT5atyRIQ59Pt7GAECU9eWjsgDDTg=@vger.kernel.org
X-Gm-Message-State: AFuF++l7AF6Rw2bm/QqnsZYt+4+4d5rI9YI4aL8l6Ic0yptmMNtPLYEm
	lVjTonbkAgnHmWgzkIDCT/3rXQ/nzqGCbetQj2xD2bh6MM6tKcdBO2qXKO3J4E9O2EKYhSDYuVR
	4vCMwW9kjkvOoimtTbIfu9SmKCN2nY3o=
X-Gm-Gg: AYBFou23p9JSIYqCdZ671WgS2sazYnMk46hGqA2KIz/rmUEDF2fWnkrE6+tHi5hN3l9
	WTtTaqa4AxvaQl94P0oYBPWzK6EBG3bhSDnFLR1+lSh66erMJxlC9HZ2eZQv+Y1qusGCEWZfLTq
	8hDrr7hO9+tXQ7oEI1Xmi/9HRnCOb13XHP+HH+8qY/gLu9xkRLAhUpPHHlu/3KvNJPwZTvqkoZR
	MsR0e11p5Ckts/OYdpVsuswlzq97UuHlK7/11Zk4nlvBgWV0FIoXG/h1BZyAWYTQ65Lh3M7enQ7
	Rh1O9LaT9QcAKFLTy/cPTuBfZB12Vi0LF83jo5VRwiDxdhKGHfbnD9RPng==
X-Received: by 2002:a05:690e:418b:b0:671:4ed:6b63 with SMTP id
 956f58d0204a3-6717fdf34d0mr2345152d50.71.1789989379554; Mon, 21 Sep 2026
 04:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913045001.1126563-1-lgs201920130244@gmail.com> <aqgO5PfShs5FG--f@SMW015318>
In-Reply-To: <aqgO5PfShs5FG--f@SMW015318>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 19:16:07 +0800
X-Gm-Features: AcwNN1U2EQbqeVHXltNz7b04PkxaH8i1uZCpkC4vS2xVRRfVK0ht_Ajux6vb24U
Message-ID: <CANUHTR-2haN5Z6ajc8ELGF57JvTHOCcFG_ZzXRdR7XwgC3PKog@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl-dpaa2-qdma: fix ppriv memory leaks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>, 
	Peng Ma <peng.ma@nxp.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for the review.

On Mon, 14 Sept 2026 at 23:12, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Sun, Sep 13, 2026 at 12:50:01PM +0800, Guangshuo Li wrote:
> > dpaa2_qdma_setup() allocates priv->ppriv separately from priv, but the
> > allocation is not released on all teardown paths.
> >
> > If dpdmai_get_rx_queue() or dpdmai_get_tx_queue() fails after
> > priv->ppriv has been allocated, dpaa2_qdma_setup() returns through the
> > error path without freeing it.
> >
> > The normal remove path has the same issue. dpaa2_qdma_remove() frees
> > priv without first releasing priv->ppriv, losing the only reference to
> > the separately allocated array.
> >
> > Free priv->ppriv on setup failures that occur after its allocation and
> > during normal driver removal before freeing priv.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 7fdf9b05c73b ("dmaengine: fsl-dpaa2-qdma: Add NXP dpaa2 qDMA controller driver for Layerscape SoCs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> qdma_setup() is called by probe() only use devm_ allocate function
>
> Frank
>
> >  drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> > index bf771251264d..0f0fe0291a06 100644
> > --- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> > +++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> > @@ -365,7 +365,7 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
> >                                         i, 0, &priv->rx_queue_attr[i]);
> >               if (err) {
> >                       dev_err(dev, "dpdmai_get_rx_queue() failed\n");
> > -                     goto exit;
> > +                     goto err_free_ppriv;
> >               }
> >               ppriv->rsp_fqid = priv->rx_queue_attr[i].fqid;
> >
> > @@ -373,7 +373,7 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
> >                                         i, 0, &priv->tx_queue_attr[i]);
> >               if (err) {
> >                       dev_err(dev, "dpdmai_get_tx_queue() failed\n");
> > -                     goto exit;
> > +                     goto err_free_ppriv;
> >               }
> >               ppriv->req_fqid = priv->tx_queue_attr[i].fqid;
> >               ppriv->prio = DPAA2_QDMA_DEFAULT_PRIORITY;
> > @@ -382,6 +382,9 @@ static int __cold dpaa2_qdma_setup(struct fsl_mc_device *ls_dev)
> >       }
> >
> >       return 0;
> > +
> > +err_free_ppriv:
> > +     kfree(priv->ppriv);
> >  exit:
> >       dpdmai_close(priv->mc_io, 0, ls_dev->mc_handle);
> >       return err;
> > @@ -787,6 +790,7 @@ static void dpaa2_qdma_remove(struct fsl_mc_device *ls_dev)
> >       dpaa2_dpdmai_free_channels(dpaa2_qdma);
> >
> >       dma_async_device_unregister(&dpaa2_qdma->dma_dev);
> > +     kfree(priv->ppriv);
> >       kfree(priv);
> >       kfree(dpaa2_qdma);
> >  }
> > --
> > 2.43.0
> >

Agreed. I'll switch priv->ppriv to devm_kcalloc() and send a v2.

Thanks,
Guangshuo
