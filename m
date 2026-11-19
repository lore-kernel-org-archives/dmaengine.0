Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108038;
	b=EY/yoRnqKxSAVTU2zdJxx6qWjMiihSbBkFPw/JtKLJ+TmEQZF7pOdOkuaojtRNWbbWPj
	 wJLV1uYP7HQ5hdxIJvQNgnqo/xQJuSgkiTVcTogE7pGI9FcKqtopqGMIszqhwomvWFfFz
	 iu1XmgPhjHUaDuvD29dcomxHM7DqtHeP/XkjxebfqoTrjiLvU2FHuZQtK39P4zJSRwEFF
	 tYTGMvgyj8vWz4IqheWTBHrk5uZueRaeYDyd1358Xl/MXe6DLBE8lLaau4EUj7fo8vZ+y
	 CwAxZ62zGvQn2mZEVY9eZC0cMyDPQ5ke+UM8Y2f+0r+5eqEm333gdHz2UhIuyIuATWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
	b=ltCCPPnREXW0SpXC8SpnXlNUq8wV0D6/bt2Inj7vgVjMM9df4ymdvgu78B6NSsAcF1VQ
	 eZuaYvFrZrudEUEKwr37n0kZBLvC4bBG7q0fG5jhxu/QEPnuok2IwtimxJV5eoTEZ9GaY
	 9g92EtCP81ZkiWgk34j2JYYDE7aRIcsf+txnx8MRbXKe8JXH6ndmCt1SDWNu9S4RAZqQS
	 WDJoTiAiibcu/tHRnW1GehdAetosO4W0pLhX9M+dGIvEkz8EtUzOWdKFOTItZOMOi1M4p
	 huCr8em8GcDt/Qlfr9hkTlULdL7EqM9BfwqJRgEMOAJY4E0P97IG/j85M7p0t6MbgLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wRLpe/hA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22860A260B
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 17:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F22860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRLpe/hA
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so243978866b.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 09:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108036; cv=none;
        d=google.com; s=arc-20260327;
        b=G83h+njAY6+nL7McOKEB/mzR8o54HLm5KtXdFwSXO5Feww8kkezY2Q8wvqvUIFkiQO
         dbiLUR6nhbFpcP1+pqT58oFzpeRmo7zdLUeOQbGNvJn9RQuKgawIasAkPoETU3R9BhVc
         S+UlRazwlJxDRGgzihkXK4qm3fZ9C2vRAUjcS+BshQXbvOnZddhfYDH9yeSilbwuMyOA
         rk0wGJolWDVyp7JuscoX79KUhxd/1V2LXuSBIFQ1ttNVCPG9GlAK3AT4RtteIC64Lcjs
         TG2m5VwmGlnl48QP1jv7xRUuQmrum3H4je8O5Zi+/VkUpCPqterdW3bf6JYN/BiIiNk2
         Et+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
        fh=xGIFw//1c3mro6IFYfQUzJvw5uFA7lqBYRYefPbDV2I=;
        b=Ilbv/AclxRhHzRNPn5JIXyhAckY5cBZsCmDpXhgXvXhBSUIbRRhwmoDYRgCX3WyAo+
         HbVttqIm6KonkhWTPxY3mnVH2Bgiv/AFDD+69hXFlok5Cetuxn7qVSCmNOMOmxYFhXtL
         n0Ff0HfqZEDrgewcg4u42XEs1B6qSbIepvP6teXFJ4UKl769tKAyaYjV+7+qcz//l1NC
         2V21ZGBhib5PbRMmtS0rP+pMd140pzTfPQ8e7clb8S61Z7fYBbn8Ha/Eec9HbyFB5zk2
         b3D5/4+Z0g9eMvHi+zKLmRlWrUxhUfXTYIPnbXh8xjrgNn+9xqGkveKiWcOaEoKAbUiC
         Cz5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108036; x=1795712836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
        b=wRLpe/hAAlQfJy2zz9jkXgo+e2IgHoHG7qcMY8CynhTQitdmTngCVmNATKq/DW2K+M
         XSn6cEE4E+4tioV9Jf7WaUweYgmRO+9aVBgwneYN1nTNROateHYH4yj66SlOmuDqT/no
         A8J+CydLa1+2cRL+XG8ACF+7ajxTjIc83kpd5uLpcbfuA0voT7bqnkpeLee/CD2OTKmm
         YxCwTPxZ4OmRr6tRwtbAhmW2yFM9aVQnn7a/ne8AHLuiT75e0BSu5OwwuQ493t0fZEHs
         yKdrqdkkVaUwhNyvK35zHtcnJEqEAM272ZL627oeLeSV+iUr/YnUFrE7cLsiLir/Qdvl
         tEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108036; x=1795712836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
        b=AYKx7ypRp1O/Ro5hD+7y3z7pHNdCpptqbPjGZbz2Jy/7zRKwkgUNuv/V61Q4k3Eyxl
         0f6AzOvHv+aJw0g8L90r5inFQkNvaxQ+Ac34P+XCSyVO/leQsIyWbR+OyEqYEibOjQ86
         MAavOTMyRKmPoB5w2/ENNez2t+ywrUBJ9nYGNkKBt9xMZHpBz814biob0QEvKVwYyOlD
         dVF8nYZhMVxACJ2unL3tMeDRqRZ6UfC9I6zR3z3tJOGwad2YNNSzc9PdfNy5vVb9JyZD
         f0ujoUYOOEDU84Iuc/OY+GdXP/G86wgyGd5rV0Sks213eTSfNbBr3XyONjNYj022R7xc
         wILA==
X-Forwarded-Encrypted: i=1; AL+hErGiUEX1TeGBHlPfBHiJ4eu1JftF1qPxpQO8WuA/5C03AnHtHcXNBJ0vPcoo2/dJGrxEazR/25hS/7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DkZT6tb4+1Y0usrrczO36WqpML5HGA+8NdaBqqg9NS46/MmDD
	ybwtz4cHfXlq4lwm/PDpwKL+9gjWzJRodR3WC/lg4gp4nzDfsEtFZ2NrQN9M0dAAprxoQjztEha
	shbe0lwhR4rmym1s7IAmGMXanU0g780k=
X-Gm-Gg: AYBFou2tIOoiTIAHaiLBPAk3WvXXpf6v6wopEExmwtc0jihJtgX66le71Bo1/mvdSRt
	tA5WfvycirPCzMEw5NKzj8uYHP9i3gC4ph0bHDhMPpYDtOJ1GD9n1kEjk9HBEy4amM2+A7Wocpd
	CLzuExq70E67zja4HtuBAqjCZDnKd4lhPlFfmLc5kTJvQMAt51OyexhU5fb9Bopiv28e/s15XyF
	graoN8l151Wve5tNjfulJmJQOVkviINEzDArpLIVLAVkHpHIHS0L9uRTYhNhbf79oH2oEvZVs2k
	sC7VNa3tSqszb9nx9Lgg22ZNeWEbVp0J9iIa3cs0Mueqpj3Q7UUHpIxU+K4BKg+QiDFcbo8wgpn
	y1QN9BXLEE5t/oMYqKdWXjyOMsSbEvL+NrDkIr1tISZGd/Vnt8YY2YS/pCyTExcv7JQkk5F8r9+
	PTJ3jl1lY7WvdQ/x78wGEAI+v6bdLjygtS1ErP4Wdf2TUCv3wLPYmJW5l6+M11bq87sUfs+XbkG
	KUM2BqSVN9NvmhOp+HCepdJ+JGeRo07lr+KEIy8xZuoxDZCPW4=
X-Received: by 2002:a17:907:968c:b0:c51:205e:6e8e with SMTP id
 a640c23a62f3a-c51319b6e77mr189422866b.24.1795108036207; Thu, 19 Nov 2026
 09:07:16 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
 <20261119-submit-dw-axi-dma-stop-pause-v1-v8-6-f8e7fe60594c@gmail.com> <av8mu_ZFxNKSgFTK@SMW015318>
In-Reply-To: <av8mu_ZFxNKSgFTK@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:07:00 -0700
X-Gm-Features: AclHuK9wBfnKNfQrHKAEZR21ICySZpM18zy-as-MrTLPIUB6oIUYW_Q6FeHZQ-4
Message-ID: <CADvTj4oMoeiqsnLaojc0G-P0twOqUqO-rhGUh5aJcbt7wuhYxw@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Sergey Khimich <serghox@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
	Baruch Siach <baruch@tkos.co.il>, Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:41=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Nov 19, 2026 at 09:01:01AM -0700, James Hilliard wrote:
> > Termination frees every descriptor while a pending period callback can
> > still refer to one through vc->cyclic. An executing callback has alread=
y
> > cleared that pointer, but still receives a pointer to the descriptor's
> > tx_result and can use it after termination frees the descriptor.
> >
> > An error interrupt can also move the cyclic descriptor to desc_complete=
d
> > before termination. Looking only at the head of desc_issued therefore
> > does not cover every pending cyclic callback.
> >
> > Use vchan_terminate_all() after stopping the channel to clear the pendi=
ng
> > alias and move the collected descriptors to desc_terminated. The existi=
ng
> > synchronize callback drains the tasklet before reclaiming that list.
> > Descriptors already detached onto the tasklet's private completed list
> > remain owned by the tasklet. Repeated termination preserves the retired
> > list, including when called from a completion callback.
> >
> > Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cy=
clic()")
> > Reported-by: Wang YuWei <1973615295@qq.com>
> > Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EE=
BCB07@qq.com/
> > Reported-by: Mitch Barnett <mitch@accuratesound.ca>
> > Cc: Wang YuWei <1973615295@qq.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 99b648d4ca76..2547f9596ae6 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -1202,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >  {
> >       struct axi_dma_chan *chan =3D dchan_to_axi_dma_chan(dchan);
> >       int ret;
> > -     LIST_HEAD(head);
> >
> >       scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> >               bool enabled;
> > @@ -1219,7 +1218,7 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >               if (chan->direction =3D=3D DMA_MEM_TO_DEV)
> >                       dw_axi_dma_set_byte_halfword(chan, false);
> >
> > -             vchan_get_all_descriptors(&chan->vc, &head);
> > +             vchan_terminate_all(&chan->vc);
>
> I have not found this function, Any dependence I missed?

vchan_terminate_all() is added by patch 1/3 of the sun4i DMA series
[0], which v8 lists as a prerequisite.

>
> And keep allocate_queue when terminate,
>
> https://lore.kernel.org/dmaengine/20261104-dma40-fixes-v1-1-48c5180f5210@=
kernel.org/
>
> Look like we new APIs to distingiush terminate_all() and free channel.
>
> when free channel, need clean alloc queue, but termiate_all() should be
> keep alloc queue.
>
> terminate should means terminate all DMA engine own's queue, before
> submit, desc should be own by consumer.

I checked the helper, and it does take desc_allocated along with the
submitted descriptors. That means a client can prepare a descriptor,
terminate earlier work on the same channel, and lose the descriptor
before it has submitted it.

Termination should leave desc_allocated alone. The channel resource
cleanup path still needs to collect that list. This distinction belongs
in the virt-dma helper rather than in the DW AXI caller.

[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v=
1-v2-1-fb7d258702f8@gmail.com/

>
> Frank
>
> >
> >               axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> >               chan->desc =3D NULL;
> > @@ -1234,8 +1233,6 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >               return ret;
> >       }
> >
> > -     vchan_dma_desc_free_list(&chan->vc, &head);
> > -
> >       dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_=
name(chan));
> >
> >       return 0;
> >
> > --
> > 2.53.0
> >
