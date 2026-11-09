Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202705;
	b=Tz7Wae809CkO74V0236FOVTAYworBXo20iNlZksTF5m4CT2DYo88CmdfTC4vGPzDDPVi
	 MXmGDWGbkNo7u9rnS2XzY72+0U7rCd6b1lQZdI2jAuAG/OOq3ujLCZYlQqpKak3GXUSdV
	 DZgd9FNuV/HaEFzG1OfX1E7zwFoVZI91mLkPBJGSysIDVh9ZoQF17QXWIHtjSMRqymCXE
	 Hzt5v3yf6SCRQs9V1SL36ACuaVxBf68GyTxFL9bn8Eb0DFytRFCaH+FE3DkHiB7SR3wjS
	 Gd9NILI4WoolOlCBv3ZrxU0oMoZSu9BMeNy6b6hyWl9DqjHojXcrCrB1O4oq5R6B5+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
	b=eSe2lWYbrViqCRGKfhSZLkmgyOtsTosjpbH9xPsoQNphELe4N0We55ko5R2LUUHPuNvg
	 N95Sl4r2RdAez7PgJmLwemxcU6tCUnBC+4AQlyPfVoBNOlnU/bzepKPzZz5z03hBdgjBw
	 x0hUpsanGGkpAMIuo3uLqERpKGZxHNDkf6GZLR+QUtl0ZFavL0utLKyA+6S7uIYUyL0SL
	 dMNuIaxOD2+LdPCzilVTUuN3D+Mk+PrTs17iiyzVHXgIVCVgAPJQ8eUGmYIA4fnVA/uOn
	 6h3Bk8Rj6NVH+HktSvsLfvc3pklEIia221yVzhCEHPwSckFHwFKxMuAl/06VZPl5ksQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHgE0s9w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57880606A31C
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57880606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHgE0s9w
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e948e56af3so177319e0c.2
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202704; cv=none;
        d=google.com; s=arc-20260327;
        b=eJj8UBShIyr65Mo1u3oqXwSqImd42uuhBt5wsqxldiTnGMKa7WMXJQC+eRFA6gUMgF
         h+qkHxY2EqXODmCGbNj5ERjRKaO3cp5QXAz10v//fYLwXF6/JykJIA32muvpO2aPUZ5l
         K2h+Jv9aDLnt4FNz6NUSVwDXcRhUF99le4M/rYPv2RRbutoWTep0aRW4CiYc6mJ1BqEs
         Yd0Uh0P4piVl1kOHTK8Ep3Le48QuvEZ0MhotisR4Eri94ntSMzwbxGX+yUZZ19JC3Zm2
         5z7QP5YdK1st/aVGduY3AYlaKWgHP7hw43kQqHnNaeZKRxApHh9WsoZhqcp4aDytDGle
         2O3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=loZrZ1hkEBiL78mCJb/mAufH2D8bGdWf1DArk3Z12JpX24QZJc/vvn8lRq4ZhFcsVX
         Kc8k4+1ljtvo0aftfJ83MPdwl1tsbJT0naJFaZOGpHg01EQL6NvegPJ4C/MpJW6xNJTY
         7FsV5LUTSjbQrkPlg5nMk85dS9haPWCGVn40RfkN1f4f9XhV+NtcJc2ZI05jGZQHfOyW
         PZ1FZ9n1ZqbWO4HZAnq51EJI1lEWODu/OXpK/A0Z5ato1tW96BBbRw5XTElW/i/JC9ng
         I+wP/cawoeIXcZe7Y3MeFvTblNQFN8R4Ip+ncR0zvvaGlr3lOAIh2rvB4txdOe2km3W1
         6zRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202704; x=1794807504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
        b=lHgE0s9wDPYiuO5t97DJtxM3a+v29liOlVNN92LqtJ9YDo95QfwKi+esBojdZ/1fP+
         EmfwxH6gwAtR5S2z53CR2HZaR5H/Wbg5Of05DTt11vZtcfbwa8sRyvCqCSziljM+LhAE
         F3nw7mof1B8k7h5uvthSIXxl1qisxmegWsFeWtJUQRYPnDWY3RtrJLubDedYkqiLUcvK
         wJ2tqnUsYZRs784dy2aRsuZw5xTaR+0AnFnr0BHbQ4wLcumICWwhBsAiYTkFy9JybFqp
         Ey4B+PU0xxbuLVuloVt3MGE0DGwYYfMQsr82u0erfB7BA4wnM8fO69Flbc6dZEs5koNr
         NqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202704; x=1794807504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
        b=A/EOWV+xNg4KhyuaYq+pCCmn+MlnaNjkigwIJB+w4p/SBnwozpoBk0MvzcDXfdOhxx
         06qRq6V4g3KgPWh4/XYXRp85MXxyW6SjhPB09y4Isa6zroUOsifdVzOmlyMhJeMngjnw
         MObfcQVBgvvl+phCS+i1Sg6aXLkBzjAG4BUmTOxcrsT7XbRHRG5r/0SS0ux0WYOb1ajx
         grKsa531oDfNn53CQWfnatmJLZQy+/BRZxEMhFLgmt4avsu60SlAE21nAW88dBR3Sfkr
         sGakjIG+wbmTVThGAmQ/UFm1Fm20nGg3zn0rgXzJXZa3xUrzI1jcu8jcefm4hGlJwJ9x
         4yoQ==
X-Gm-Message-State: APuU4Z8ArWq5a+L8kiJ9SCKNXdegeYNXfIsWuYYPxgJgJ2lUXfw1sIx4
	VoZULMsCRB25U5gFhczht+msjSsSySwIzyBimQwyoYJou6aBwPaL++6UVgPcZbsz0UAIRUXwAfN
	Jlz1NFGhZioRJb4bmMW+dBLt57w9IozsUCKbVsDk=
X-Gm-Gg: AYBFou1HKsI9dn9+5FTqXRizSVaJDTPtRcFlO+pceYFuEEa6hY6HBUXlXkZrXlklGXj
	VucHPafcS13x65ACg6Z+X1IMAF6fL+7AVtQDmSJVGOAxoMusRQ+UViIHSWU/v81OXwWGtY1BLoA
	8IVI9BiarHP7ldxOrcxY8RN5AtvM9xieb4ssICgrFENahnQclK6WqJAzCgxfLev2krSEdhsZtrg
	VamHeL0cnOqN4H5V3T8lK9cN0+/j3KZZnRaEa4Eh6jTh2b2UERSr3LjA2Oh3sKyDiCMk5Jqqown
	qgnbupVrSJG6X4iqr7FakJLUM4AezEtHoa7WAM25K9khmJJrU7bsUMgVc/Y/ooK0LIYaN4SC4mh
	dZNzW0rtmdk9LQnx63HW9vnP8Y4ugkvFQYUUdS+PFe4j6bNRrqu9OMLIHO+nMTshAwv8yRAGy7R
	NMOSDFlnLfEg/Qx9RU/SmTbA7ZSGIbUZ+TwQD8a6XifJXS2F3iX6ylp/dPgZtLAMVd4fmGqaQEd
	XnLfTkdSwIufj32xwCwJ7CqXx35DQ==
X-Received: by 2002:a05:6122:514:b0:5ec:4a13:8aae with SMTP id
 71dfb90a1353d-5ece725c28fmr859093e0c.17.1794202704155; Sun, 08 Nov 2026
 21:38:24 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
 <20261108-submit-dw-axi-dma-stop-pause-v1-v1-1-c48ec19e9ee4@gmail.com> <sashiko-outbox-204416@kernel.org>
In-Reply-To: <sashiko-outbox-204416@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Nov 2026 22:38:13 -0700
X-Gm-Features: AclHuK9ASlVQAUTJlWniAV85BUmqurDEuGUQWWbXGFT2lkxlkDeZIeDsjnLZAkU
Message-ID: <CADvTj4rtM+HpSvfktbneuEfCEctTHpyJ+Bo=BsbpVt4X_8bueA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] dmaengine: dw-axi-dmac: use-after-free in
>   dma_chan_terminate_all() [1]
> --
>
> commit af0999f332d674abe73e6d4b71aee90f2aef6ba8
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw-axi-dmac: poll the correct enable bit during termination
>
> This commit updates dma_chan_terminate_all() to poll axi_chan_is_hw_enabl=
e()
> so that upper-bank channel enable bits (channels 16 through 31) are check=
ed
> before freeing descriptors.
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 7520c78f55ccf..49f65486e8626 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -1181,16 +1181,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq=
, void *dev_id)
> >  static int dma_chan_terminate_all(struct dma_chan *dchan)
> >  {
> >       struct axi_dma_chan *chan =3D dchan_to_axi_dma_chan(dchan);
> > -     u32 chan_active =3D BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
> >       unsigned long flags;
> > -     u32 val;
> > +     bool enabled;
> >       int ret;
> >       LIST_HEAD(head);
> >
> >       axi_chan_disable(chan);
> >
> > -     ret =3D readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, v=
al,
> > -                                     !(val & chan_active), 1000, 50000=
);
> > +     ret =3D read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, =
!enabled,
> > +                                   1000, 50000, false, chan);
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can dma_chan_terminate_=
all()
> race with dma_chan_issue_pending() [1] and free descriptors while the
> channel is active?

Patch 2/3 [0] moves the acquisition of chan->vc.lock before
axi_chan_disable() and holds it through the stop poll and
vchan_get_all_descriptors().

Since dma_chan_issue_pending() takes the same lock, it cannot restart
the channel between the stop check and descriptor detachment as shown
above.

[0] https://lore.kernel.org/r/20261108-submit-dw-axi-dma-stop-pause-v1-v1-2=
-c48ec19e9ee4@gmail.com/

>
> axi_chan_disable() and the poll loop run before chan->vc.lock is acquired=
:
>
> CPU0                                  CPU1
> dma_chan_terminate_all()
>   axi_chan_disable(chan)
>   read_poll_timeout_atomic(...)
>                                       dma_chan_issue_pending()
>                                         spin_lock_irqsave(&chan->vc.lock,=
 ...)
>                                         vchan_issue_pending(&chan->vc)
>                                         axi_chan_start_first_queued(chan)
>                                         spin_unlock_irqrestore(...)
>   spin_lock_irqsave(&chan->vc.lock, ...)
>   vchan_get_all_descriptors(&chan->vc, &head)
>   spin_unlock_irqrestore(...)
>   vchan_dma_desc_free_list(&chan->vc, &head)  <-- use-after-free by DMA
>
> Because CPU1 re-enables the channel after the poll finishes, the hardware
> continues processing descriptors that CPU0 then collects and frees.
>
> [1] https://sashiko.dev/#/bug/linux-d3e7b3db-d97f-48be-a317-9ef1a4cd9953
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-d=
w-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com?part=3D1
