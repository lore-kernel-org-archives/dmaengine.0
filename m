Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430848;
	b=NYrxujYxqgPm33VSFyg6ac+qiktX1y98khQODhxeJ4F2KgFYBZmn81UdP2euMx05I4Oy
	 pqBlXjRgP566ABEzlntqNuzCMO/Et+7+1ToYrcUrYyk6U1FJ0O5GhEHvrtawMuk6hjtkR
	 9GVW7951dnb5xVzKFu2u6wic7cc1DWXmoPzmjxy2mLiXML9JOq2LwgkKQFpJZuuwnIuxI
	 o5PUSWbO6jOXuuPzTmUQMY9Iu4y0Z0oc9Fnvh6KwKlNIB8TxGsWpCv4eSmgxSwfsNj3JX
	 wmyABQr/vodOe6N2BkSwytuhRN6dYwsDcVfVIbxDeNDAY2l7W332IlIgnvEzJAtlYhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
	b=s5IVLfLGBGDjrlpSnCYttsz2z4iDSUBYHKkIQSiVw2MJlLbg3rms8fEiRmhP0taFSuar
	 jYO1NDV8NA4JGUe/tpRDo9D1c+gk5n1726LN1eC8Tr8C1TF7npuLx3UKPDRKAi+nhvlHd
	 nLrqsyTBECk8VPzCLKiTw22E55wJwdEN8XNFHUBvzJsKAe5HjXb88TzbgdqDjrRrxy+GU
	 Ruio2b7FcYuXubvaSRzWlbQDEweISPWvA4BOUx0gb5iAcvVpNPl8byErVfUKtOY2Au753
	 GlQmE/qJZxh/7TErT8kfp+N9KUvVISjEqSWjYvqrFAuT5iEbee3A2DpNWWmeNwU/PUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8FO+b7s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F6606A31E
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 10:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613F6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8FO+b7s
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-497614c95f0so1711905f8f.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 02:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430847; cv=none;
        d=google.com; s=arc-20260327;
        b=jQMEdN4qFX8EgBuUnjf0oXRh8I6wjB/NG6vGfRCSGJnsWweGlG4lTAA7tGktrzgZPD
         Qa5VJ4441zRrfPNL3eQtC/J5NIiGIAmCWjI7v9RvoPa5n8EI0ij0dg8zFSPp9O6H4xcw
         VI0QSBjn0vwRsL+VKuq1pwcC4yOtKDLQLujzNK8GDvfJaNjfrD8mhhR3kmieQ6MdrXe+
         m65uRoKmpVOX4WF17rMkF4VDcG1zzZ7711lrV3JAz9ZtMFQ1Nt9JquP7v8t+7WbvevEY
         wKH/kt5BiKOjLaw6QlmrF3kxj0QUHW2IuoqIRYL66EJWuR63X6Sw2csV0VLtp+o5Nyw1
         bBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        fh=M3SQfQkV/qrV5dOulgnXK559latpbsaDCwcY+t3YXpM=;
        b=K4kRgArtYT0KNXGLAgMvJc5/2OK/grY/4mvrc4FL7DOheHxp+10Wo4ll53z97M0MBW
         h8bVjBNQ22qamHHGh+3oTM0eSdSGzxuPSebi/s0TdIx0Y31bgG+TcHmQ9EKNyMry1FAh
         wwJVOuGsHbF/xmU9PmbRhxiDsSUG1uYlbOSg7bVKn5n+y1J5T3e/H53FsZpDsjFv2sj8
         MHL4DF0Q1kfD529Anl8Zb2y/gBB3I8FMSdZfbjVtW+lO5ldG35SsATBKdlOZCailOlxq
         3FKj11viwg6e3Ldp9JRM3oYCagT96HELLPbjJxxGJgQZefiKImX/IPMQr77BmFv5KWNv
         GYmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430847; x=1796035647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        b=h8FO+b7sXKrfh+RneWspU4V5nRSeaoetymr2SbANy4D40BexeOkka7zwiD8hsTrw1i
         0Rdtfv80jpKNfbf/FB8w9iK++OqF0B/ag89CqSaqiSfQ72HPkY4QRGZ8sJoDSuNjp8Qr
         otlvsK8aF6zNDii8iH0VDGWjh0ZD7iiLMoxICiv/+cS20uKHKqc5mwUyr26Jn1ZqCf+C
         qOP3YBA+dRVoqPoPPjIKYymkcIn1nCDSMDVSC4XeS6JiRNHWAGqy/ihltvupi87jDdcp
         5Mm+7gBjD+Jy4yLpDuYn5pyanHiPh+IQG1uRgK6U95KBd/pMzBwOJcYcYPUuTKeWwru0
         +qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430847; x=1796035647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        b=dJJPgeRFSWf5MqbN5/D8SiYJAsttAp6mssDQEwmGvJqhlOihot/9LdhjTYyVWLDB7s
         6slrsdsOFwSYpLNzSTelSWdlFp6CHm3xWSshA2lRNf1zEurQnAcqvmevhoRKFm0O/0Qu
         4NWcbEDl/+9Jqjsmq+RNS4R/JZoz2wdvlj9Po1zY27jF4Fd4Rl4p+aeFZ6RTMXNXkC37
         2ljqekRd9DeZb/58nIhyyYkSRvD30hVGvI6V6N0GY5hDokkoiU3M0R5yc++9GCDYxX2C
         u9eMvvElR2v2Cz5fqOoPSS7240DO7rIUQaBleZtreksWqXpHsjCoYGyXWydFrjgpAhnG
         vJrQ==
X-Forwarded-Encrypted: i=1; AL+hErHR5VI0XVlfxCLeo11h/pQbTSePkci83q64gVYG+YA10GoR+r/6X5EZdxCt5+j4eVXu5bh8JhHMF9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FmMAwphEKbbrRHIA8ZNg+cVOZkQGmLAMTuNjomcK61/J2rDUR
	W9ZpHw2dJJaLsr5YEVXmAPpVs5ulYjRnNJ9NNBU8uypu4vMhlpozuhWBCj9jGd4XqpsLoby5ISQ
	MDbsD3uAB2j316HsyZFwmWGx9VHDuJa4=
X-Gm-Gg: AZFdTZeCLljk3UxlQ/oWFaQlwBKDx+y1LeHaxWi50bfwJZYJK4Jo4fkb6EGDoD2dmvC
	Qqrpjb641tEpnvbMumgh87pHqawXoAeLSGahO0VgjyEhyUM1KXanE5C3AtdGYb2e6CaJHeDlBdw
	HsHZGdYApMWysFlwxlZQhfFDjAhqAU4BysmclPL0IL39hALiYZjjFWPzSyS8KMZ51Ag+V+//fnV
	BMn3zzGhu4N3JVUR//kIYL9axO95Wcb3t6vfWWVLA/iNLdXKBW3dbMRWKx8aWDwN7Sp8yQt+AAW
	fp3S/BgBKSH1aNavI1smQCrhhV33/GbZp52o46o5vrJE5vQazGE+WkSdtmZ279lMgkh+81iLGHS
	qybZDleeBlnV/hINzfP9pz9UqeGH6elfVFEF1fNOd0aK4AWZDKsCJxhlPEF2+kSB9iJg2j6kyC9
	I0MqfP0c+nf1CTuAWo9Tn5sckclTa1yT/kFGnxlVIpR+4Po9twZK7cXg==
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id
 ffacd0b85a97d-4abb6746af3mr21461877f8f.56.1795430846438; Mon, 23 Nov 2026
 02:47:26 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
 <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com> <awQMCxhy6BurLowU@ashevche-desk.local>
In-Reply-To: <awQMCxhy6BurLowU@ashevche-desk.local>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 18:47:14 +0800
X-Gm-Features: Aa3M54oppWHvQUNnUqJl7rdU_k7WIXS2zavZqioNamwXEqP2RCrMovzITl6Zh_c
Message-ID: <CA+X8Sdj8OygFXHMMs8mTj5RF5WuBW1uvsGcaMff92X6k_4U=qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ludovic.desroches@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org, 
	dave.jiang@intel.com, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You have to wait a sensible time before resubmission.
> Look at the v1 and act accordingly.

Sorry, I sent v2 too quickly. Sashiko found a real problem in the
at_xdmac patch (1/2), and I resent the series without waiting for other
replies, so your Acked-by on v1 is missing.

This idma64 patch (2/2) is the same in v1 and v2. Vinod, could you take
Andy's tag from v1 when applying:

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

About marking chancnt __private: that makes sense to me, but it is a
change to the dmaengine core, so I'd keep it out of this fix.

I'll wait for more review before sending anything else.

Thanks,
Suyuan

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E4=BA=8E2026=E5=B9=B41=
1=E6=9C=8823=E6=97=A5=E5=91=A8=E4=B8=80 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 23, 2026 at 01:17:38AM +0000, Suyuan Wang via B4 Relay wrote:
> >
> > idma64_remove() frees the IRQ and then kills the channel tasklets, as
> > the comment there says, so that no tasklet scheduled by the interrupt
> > runs after removal:
> >
> >       for (i =3D 0; i < idma64->dma.chancnt; i++) {
> >               ...
> >               tasklet_kill(&idma64c->vchan.task);
> >       }
> >
> > Since commit e81274cd6b52 ("dmaengine: add support to dynamic
> > register/unregister of channels"), dma_async_device_unregister()
> > unregisters each channel and decrements dma.chancnt for it, so the
> > count is 0 when this loop runs and no tasklet is killed. A tasklet
> > scheduled by an interrupt can then run after the devm-allocated idma64
> > and its channels have been freed.
> >
> > Read the channel count before unregistering the device.
> >
> > Found with a static analysis tool and checked by hand.
>
> You have to wait a sensible time before resubmission.
> Look at the v1 and act accordingly.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
