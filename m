Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259735;
	b=J95nEr8yFL+dQr7b5V7AUWal76aJFP/83UqUGEY/aUdf+AG/QWGzYH5hfyyGqvxpJRKy
	 JsimdHEizu5ahZ9TLwVMMPNTru42C/+LHPDt56euXhP37PDu5bwUyRBPGH0ekXDFVkEcj
	 Zx9XYARNpf16rya9tEV87dBZ72gDCKUOluID1DWfR+2o4q7ScGAzq1Skl/nTIyp8jcx7g
	 FAjGV+mzXKWXxyRPGqHPVFp4b/anlgW/lEpaxoj4zyRkpUgrzMWELtn5XzUWEcDufMsdw
	 TeUmC29FiHzZ9Hv6fx2yi8O80TJcfUl8hV0mo70Qxsbxdyk8pJBaBXgHDInnivcp+IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
	b=Nj+IixcemHVfWuvqWFwxng3A8FgLPga773/w4n2ukwdhY2v/71VSWME3pFcVnT1hUB7q
	 BvAKjtP6dAI04HVu2fqhaUMWgo4MIitLB35h+hWhoWASRhM4//A2QOsCT0TUJL5apkDSH
	 XTBCW6A16EyoL+Z+JQ0wv8543ACL4LMYc4c9B9BIoSUCI/2bCQxPGdD21ZlYONhXKUMvC
	 ZwWbMkia0yK5cw1+1P0VhjArl0M9RU4R9um/HRh7ZyGt3N129s92blPItUMLZprMhEPG8
	 oalxGcttajMLYUioYQECSjaioSztceoqW1Ex/2MRGfgzix6ptX06adWaZg9ELUL4Hcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGc0Y9V9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A570C606A322
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 07:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A570C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGc0Y9V9
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c468bd799ecso234286366b.1
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 00:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793259732; cv=none;
        d=google.com; s=arc-20260327;
        b=V7gucP8oGNlJMigvGYNqEP42boxet6dXYscCuZ4Luwdg0PwfEKE+96C0+zlHaNCmKT
         9mNoZ3TaSOo95uAHddydNcmwPnkaGnW5/fvxhjUpvXkAzh3HIBeKvXvKhWEqieZ7IL2w
         cSEAx+QsZomMzxafF3f7V66kexVIEF7JIyylT/OrvekcRq7sseas3eXvTXVnE8IJGOkc
         aXDa+B9sV0x721O5A1JBjleeqxnqmX7M23n06ImOuXJl9dAkfQEnTIL8MXp+NMZAaQtO
         EW3MD70zXOQy6MhyA3dynwnRHET/7bEpM4HWif7MfVyyahHg3h1+FUZ/LNxDO3PUGYS5
         Wl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        fh=sIJic+k3m4nLeV2uDZAYQJpMFfwSOqlrF9DPSs7Zdno=;
        b=Utkxu5D4FpOQICv1wW5+pMQ0B3gAWaby/od5a4TGOS8xYmdNnUx2Grqo0KcGFvypSH
         MWyUtfLJda0wzn+Og7USwtMOtnhbcL8iyaBk42rF5EzKTIiWe6tBmnMXOYazfVkWWJau
         EuxMotgBmoUWJDL+eVc/sMl5glrtGCA2k9qZCot+PRFAPNSqBsIaicLK+JKHmXIV0Ptu
         2JoIlIviu3qn6zaVAgXUgW9k5W2ucpnOozTJJCO5nNEqeMimuJjF8PwcF/RlWA0H3MrW
         OokZIha2VTO0w6ewgiMZnvbVm1jjnZlPfPKFHmYSzEZq47vvMVO3TThpgBYFvjjl6nX3
         5QGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259732; x=1793864532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        b=zGc0Y9V9yQhkIss1bYi176ej2dIv7fz3bctn8ItT8bqV4TE0UelQmq2Gikz9hLf9Hz
         vNHl+yFKBv76Vfu7Mg4/OWVcFBObMsIzU0zhaG3Uq3plDzVC/AP2q2OCraNH2ris5/im
         Zqb7RhRuV0Q1CZHmUEiYbs4cJE6Mg+Tkv665xqAuAvHX5O5/PC+Z+ZwaQoJQ0oBKybhE
         Mpf81dGZ9wDrJnNiMpbsgK9LEX42jxZxNRQo3HCEkH2W0TlP81/EcvOZ6ZEfPoGjABXN
         PoQlOF76E3JGhpf0sthOBkS0X5fUgRGZVYUW/Ft2YJqpukUhNo+w/IqwKx4EuoRIxc6G
         CEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259732; x=1793864532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        b=gLhRpbAof4tBXjXrchnXxJuF+bZcfrceeegFoHDyLH0eFUW2duM0Jd6rGkLKl75UJ8
         nv7gY1gyEhKm1Q1cvYOEv95yaxmLLl+iF0Lr8H2UNC217cLnPWo2g3JCfAsC6f24A53j
         fpHklujwcT2xD+RnnI/N+fK63LufF+eZRZxA7RJzzW/ktd8AywCKhzFA5HkSdlDYHTAT
         beRIo5lboVXDWZ7E9WeBzLAJiEFvwWi00hW1xKvGa8cFHc5kiVfkw+LermVcYcR01rnQ
         w6SyCf3e3LgiQL9lBG+gnZpJPzIwglSaYw2aJW9IwvtYRgrMqwn7iu0Dfqaxkmz3n7fl
         Mdow==
X-Forwarded-Encrypted: i=1; AKwUvByGQfI6X/5mW0Z2eoGnN5T6i2xSnacNPoDLuc3+wBNbN8i+vunD+OT6uzGRp0xW/ccjPWoeWnysZWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMZHLVMs6VRWFrVjJc3DU7rn6xJpEpcgUQkofS+gezxrCxlwyu
	hj/p67X77VXCUNuAYHzMTpIT/TVTCsISiYTnLy7tTeojzRrSE0gYnp0+IYfwmFaiKcAqUeM+GZZ
	D58Q0w6hcKDBv2TEJy5LFFYeC9yEu8LE=
X-Gm-Gg: AYBFou0AWi3C0cuSsESLoFBTPDYd/MmD6hq30CC1DIuNTGeh9Tiov6xNM2bUxp6hYmC
	8a6RBKpmwDcuEURHD8009HGjOcCyPfh+tbb6BIjP0uA+gSRU/FkXtsr3VLSymbgyw+TB5z7Q7fp
	XsGGP1s/9oMJNnEdhMbnrY9pVSU/ETY8mLc5rVKCUBB69xOOi6fB+lDpJTmY3KxguJJT/bTPTVq
	cU6yTXLuM6aaGJj+3zZpSV8HBBYRZgRtGVcoUmcxJsfBlKF1w8WymsxMiD9LnW6Ae1oRLi7UhpE
	SbP9y5RnCNqY4a96iHGDW5Vzlzbh51+3JFuNSmnlzRIwTYh7j0tYTcUK+l8DfG/1HyL3+P7dDvF
	sT0GeFlqyeyq3kvNa/mQjsXkZ8mH0ctGyUpW52hI=
X-Received: by 2002:a17:906:fd45:b0:c49:bf6a:28fa with SMTP id
 a640c23a62f3a-c49bf6a2c46mr282671766b.28.1793259730604; Thu, 29 Oct 2026
 00:42:10 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792988985.git.zhoubinbin@loongson.cn> <dcb49d67055cc41af3bd68cce01c05e73a7c2787.1792988985.git.zhoubinbin@loongson.cn>
 <auIe15pAb8ZZWbnV@lizhi-Precision-Tower-5810>
In-Reply-To: <auIe15pAb8ZZWbnV@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 29 Oct 2026 15:41:57 +0800
X-Gm-Features: AclHuK8kbVDGgdNrbovyTyakUo3h504IwuEClXkjkVVljd7312xDrPpt32lzyXs
Message-ID: <CAMpQs4KMbvRpF9axnnEbO6Rcna77WqHQykv4jvw-EOnSbH8FBw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dmaengine: loongson: loongson2-apb-cmc-dma: Program
 CNDTR when advancing sg
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Thu, Oct 29, 2026 at 12:12=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Mon, Oct 26, 2026 at 12:31:22PM +0800, Binbin Zhou wrote:
> > When configure_next_sg() moves to the next scatterlist entry it updates
> > CMAR but leaves CNDTR at the value left over from the previous entry.
> > The controller therefore keeps using a stale transfer count, so the
> > hardware does not move the amount of data the descriptor describes.
>
> How it works at 1c0028e725f1? not test ?

Let me clarify how I found this and what I actually tested, since
there is a fair concern the patch may be redundant.

I hit this while debugging a CAN-FD driver. Reading through the
Loongson CMC driver I noticed that loongson2_cmc_dma_start_transfer()
programs both CMAR and CNDTR for an SG entry, but
loongson2_cmc_dma_configure_next_sg() programs only CMAR. The
asymmetry looked wrong, and I wanted configure_next_sg() to program
the same set of registers as start_transfer().

I instrumented the driver to read back CNDTR before and after
configure_next_sg(), and forced a non-uniform descriptor by
temporarily making period 0 shorter than the rest. With the CNDTR
write in configure_next_sg() reverted, the read-back stayed at the
period 0 length for every subsequent period, and the TC interval
matched that length =E2=80=94 so the hardware was reusing the first period'=
s
count. With the write restored, the read-back tracked each period's
actual length.

That test required a non-uniform descriptor that I built by hacking
prep_dma_cyclic(). As you know, cyclic mode itself is uniform by
construction =E2=80=94 buf_len % period_len is checked, and every
sg_req[i].len is set to period_len. So in any real cyclic user today,
the hardware CNDTR preload mechanism already reloads the correct value
on each CCR.EN edge, and this patch changes nothing. I2S audio works
fine without it, and I could not have found the bug from userspace
alone.

So yes, this patch is arguably redundant for the current in-tree
users. I kept it because it makes configure_next_sg() consistent with
start_transfer() and removes a hidden "all SG entries are equal
length" assumption, also I'm happy to drop it.

>
> Frank
>
> >
> > Program CNDTR together with CMAR so software and hardware progress stay
> > in sync.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson =
Multi-Channel DMA controller")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma=
/loongson/loongson2-apb-cmc-dma.c
> > index 8b8d530d60c3..c654e0572902 100644
> > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > @@ -266,6 +266,7 @@ static void loongson2_cmc_dma_configure_next_sg(str=
uct loongson2_cmc_dma_chan *l
> >
> >       sg_req =3D &lchan->desc->sg_req[lchan->next_sg];
> >       loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, id, sg_req-=
>chan_reg.cmar);
> > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CNDTR, id, sg_req=
->chan_reg.cndtr);
> >
> >       /* Start transition */
> >       ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
> > --
> > 2.52.0
> >


--=20
Thanks.
Binbin
