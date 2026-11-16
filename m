Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804381;
	b=oD9u/WHmrne+JM5xE4mdmLxl9/KjFU66OyyECUDc0Bdmfp/U/WkzPydJHpgNoihgTDCt
	 5kPVcA7XiqHAQcP2VbSFoNZ6scYTg6Tpm/AAZsRvN9EOpnBx8HrN4TMxASBxcHewnxAXN
	 hM9MRkklveYYC5LiFmR5Ra2tBz+Y6vlhP1Tk/vB0/BF4Nh1SkPx8AlZLfK6SoFwKjwBcF
	 qishPAWw47qPVQNEliqaWHU131V7XXyCa4iy/3ZBKVsKWZ9+6nmnx6dOSm1piDDKlAHmH
	 JxESb2lhpv8JruaQg+blmLf7E11qXbXmafUBDPs7ZQXcucfyeIkjqBQi+1iSWMUwylg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
	b=n1Vnje01NGIpSo5nJdgrfSS9COCAyqWn85GG5LT1hLZ0FIZdiBil+hOuC0CbVEeEsUSR
	 d9ct885fVWFZRch8RNaxTKqZKAvJ6jTR3MuR+9IXcv9GdTV9stHhqDFId/dX526f7p3Sy
	 K85gT2qG8B/dxp22WBK1t+qlh1d2nKUjKln8pVN5w9KzfBd7Z083JuH0XL5f3LDEJMhN4
	 o+wZqBLWuEzH2mOjxfKuloSvu4Wj/iE0b4yx+qi5pGTpqsfcNuTAvW4Xlnt2IO9XgKc3N
	 zqXX9XjPzFYQYfMryus4kpkO9UY3wnFvCNOtHcDNV7hPHEnzjd1tQcA5pGb4zTC3Ljg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4AEPADB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510E606A31F
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 04:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E510E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4AEPADB
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc91ddf447so909337137.2
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 20:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804380; cv=none;
        d=google.com; s=arc-20260327;
        b=g/X53xdF/ysuEDLP2kjOHT72784DOc5D5Zwiu+YONoavypo8jyokHVYH8ddBZ5eneI
         Rhtz4LNsKI49BYwNyf8qjnoML4w9wqbnvh3GueJGshql8GC+zJHa2kHhC9k9Kb8GntpV
         mJJaYxf7CqoirW82auVka/X/xBg1PSuEd3JMyg9PYkFkCK0HJhIK5gxeqqwNmS5lG/qS
         SvFChMARNVZM966RKLJ5PfY/wibk9inY0NnfSNV9Bpdf6stos7q3wa31OS3my3yup4pX
         JwpKONRcH4YELyQkq0gLvTNdNgRf3Yf6llSp5KTeHc+AoDhxdeEUMD62db1BiBZp4dTV
         gQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=dvoAmDxeShNOIN5R82ngz2SujV7occyfWaMac4N+IjPy8G33ft5UFdIl2tTzI6z7P0
         A7jSV5X1Jr1jLr5lID4qJQ4KC0ZumGI85Fx7OeIuS5qnG3Cpet/cmMFG2wUkcs0xx6KU
         ZWsmB79fsdyP6kqI0ja23fO2hB/TUZLUBQ6zy3w1nEyXr/4CX3tbclYx+UAQ3Ow4nXmO
         fh5OYspRF4mGD/EPr6OSDEoTTdCf0elU9mJo4FgvBHqtOWdqasHBxhuc1RjNoSRlpFju
         aSHq9ZtmP7J6s/f+RPuw0lQBaaOeyk7chE0zh4BBI9iki7oIcp7qkYFQPDqN9ki6SPEg
         f25w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804380; x=1795409180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
        b=g4AEPADBAoJKUHu4l3d4+7N9UDKPeOnD/OQRcfoxBw4TCEUcwyH1b/r7T8WENH3f/c
         Vk+R/afsPioTIspNKnj6V9Rr0JWtMJ4NsxpNqJXDhxwT+0K/i9l3sPpiiakhp8Bfi0Tx
         DC+kWyaFNsvlNF2njIxYin32tbtqx3NzqfEU0Wpx/UosSaZBz6C9qMz6WET8dLnxPQFj
         zJ6vulj9zX05covMU5PL3EUY+pN8OomTMXtRwuXb+BLMA8/kALIKlK5HASqKo3OUWpA7
         A8cMuRkvnoauTjqvxH8bVeEBZ/SzINy/L921yIXPglt0T5QSqd0o0r9GYi2CxStlokeQ
         ktmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804380; x=1795409180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
        b=t3+6CY3URe+Lai2rz9kD/qDqwYJRHc5wLjwLa+39oKLPEiHcdAeDCzEu/FIvboPX9J
         9uLOqUFRo/AV0sa++5zO8rmkFV1VGJKkauMXCR5QIf1hEGqDXciToX1eymWsXDySSv9Y
         zUhAVwV18Lzl0I9b044Z4bZC8/0qOUdKLi35h9EHhFVNVCdn03H8Y8XS3hD8A1ttVLqD
         3rSLs62m/RZn9i/7K/mLowSeDDY9/sCYAThaLw9iqNdoEAvORD8ZasA3la70vPIEaylm
         n87RFuCwDa3SqIUd1nGHpFEmGQOItSwHMJ+B+bELuERybOj6o0VzBdBHRDMFtIXgwuhn
         QfFg==
X-Gm-Message-State: APuU4Z8kXqkHonkNxdTMreqyToHbJjyxny2WFaMbAw2cM2TVaPu882Sy
	tA9yjrYW1elS/C8zRpTaacRkXHyOS7XVkKB2RXs+ROOGcRLA96YA/itbtrU6MJVBkVM9uQPjtAd
	rgOsnsHRwGNlFxZ6ekBqNH/0Tys8oED35Wje2
X-Gm-Gg: AYBFou2NsyeGDodZD4n9J2XuyRZ77diOgwsc8y6ypQ3x1S/7N5ssG5fBHErjDKz7fKJ
	JT0ieEuGjr+kY+3MMw0q8DY4PGfct2snoLFiJr22wungZV0Ua+rIUX0kqho1Yq1r5QYkM4CBil3
	KuU3IEb3/P4eZp33peh4Rxbpg42wc9YHa4bjEuHR8cJeJtGUDZ+ARjMJEhiizoaoGVsw6RA40lB
	hMeNtBy1AGEmz/9P6/C5bv6lbkkea3Kq9MTTysqjBJrStDBbBiuMZWJebFO8wK17jMm95o+HTcu
	3SvGeYbjEaYNwN3gOwaSd3nsNiZAXmK3OkKqsEgdJELgzL8BSPHolztClMTV0Geo+bqyR8O2UJ9
	AxzgfUkUbEbV2bt+xo8YLSppWCGesRo7DSmJIAGTU6rJjLxqlIcWDyMhmpwXiR2aC3fSd0mihql
	BhJZSChXlL7eokxH4ZD1BFi4I7AuKb04FVtTcO/VjF/rbYNk6TQWYZ+bHmqB9ihNZVhf52vE0UM
	heqehwLekzB/rvfPBw/iBmhqzNXK5pzOaTkvXDBveT99JB3miY=
X-Received: by 2002:a05:6102:6891:b0:7d0:3ed0:c61c with SMTP id
 ada2fe7eead31-7d64d766e5amr2397924137.16.1794804379752; Sun, 15 Nov 2026
 20:46:19 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
 <20261113-submit-dw-axi-dma-stop-pause-v1-v5-5-8523a27b5788@gmail.com> <sashiko-outbox-212590@kernel.org>
In-Reply-To: <sashiko-outbox-212590@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:46:08 -0700
X-Gm-Features: Aa3M54o7ZTXqLrtiGZcfu8iVaGxtj5OKcZ657f_U_Ri-n6PYVX8QpmTaqx6061s
Message-ID: <CADvTj4q34rEXg1LTnz3ywqxuXzzf8z5qCatSEyjtHMrYQWZFBA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] dmaengine: dw-axi-dmac: preserve pending pause requests
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dmaengine: dw-axi-dmac: cyclic completion in
>   axi_chan_block_xfer_complete() bypasses suspend cleanup
> --
>
> commit d0a0ce5ca0c535aeb1aa58ba2ac57a8edf27e326
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw-axi-dmac: preserve pending pause requests
>
> This commit tracks pending pause requests and active descriptors across
> polling timeouts, interrupt handling, and cyclic transfer completions so
> that pause and resume operations do not lose hardware suspend
> acknowledgments or prematurely restart transfers.
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 1a53fbc951a91..cd9a5b45d295a 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>
> [ ... ]
>
> > @@ -1134,11 +1145,18 @@ static void axi_chan_block_xfer_complete(struct=
 axi_dma_chan *chan)
> >                       }
> >               }
> >
> > -             axi_chan_enable(chan);
> > +             if (chan->pause_requested) {
> > +                     chan->is_paused =3D true;
> > +                     chan->cyclic_restart =3D true;
> > +             } else {
> > +                     axi_chan_enable(chan);
> > +             }
>
> [Severity: Medium]
> Does setting chan->is_paused =3D true here bypass the suspend cleanup in
> axi_chan_wait_for_suspend() when a cyclic segment completes after
> dma_chan_pause() times out?

It bypasses the wait, but the channel has already completed its transfer.

This handler processes DWAXIDMAC_IRQ_DMA_TRF, rather than an intermediate
block-completion event. The driver marks the last LLI of each cyclic
segment accordingly. The Synopsys DW_axi_dmac v1.02a databook [0]
documents that hardware clears CH_EN after the final destination
transfer completes, and that disabling the channel clears CH_SUSP.

Setting is_paused here therefore records that the completed segment is
being held stopped, without restarting the next segment.

>
> If dma_chan_pause() writes the channel suspend bit and times out with
> -EAGAIN, and the cyclic segment then finishes in hardware before the
> caller retries dma_chan_pause() or calls dma_chan_resume(), this branch
> sets chan->is_paused =3D true without calling axi_chan_disable() or
> clearing DWAXIDMAC_IRQ_SUSPENDED.  A subsequent dma_chan_pause() or
> dma_chan_resume() will then hit the early return in
> axi_chan_wait_for_suspend(), skipping axi_chan_is_suspended() (which
> calls axi_chan_disable() for completed transfers) and leaving any late
> DWAXIDMAC_IRQ_SUSPENDED status uncleared across pause retries.

The sticky SUSPENDED interrupt status is separate from the CH_SUSP
request bit. That status can remain set across pause retries, but those
retries leave the channel disabled.

On resume, the early return only skips the wait helper.
dma_chan_resume() still calls axi_chan_resume(), which clears the
suspend request and DWAXIDMAC_IRQ_SUSPENDED before the cyclic-restart
path calls axi_chan_enable(). The old status therefore does not carry
over into the restarted transfer.

Under the documented channel-disable semantics, I don't see a
functional failure in this sequence: the channel remains stopped
during pause retries, and resume clears the status before restarting.

[0] Synopsys DW_axi_dmac Databook, version 1.02a, Table 5-9:
  CH1_SUSP on page 188 and CH1_EN on page 195 (public mirror).
https://web.archive.org/web/20251219165400/https://picture.iczhiku.com/reso=
urce/eetop/wyKEEOUFJDggQnvB.pdf

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-submit-d=
w-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com?part=3D5
