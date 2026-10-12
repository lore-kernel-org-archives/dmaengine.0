Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2DB367F2F
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774933; cv=pass; b=aecBCNjfziihr+uaeq3l8k0b2E1cFizSosc9PMLSk5r9LWiwXZbaVkcGW+QnLy79qhLALtov2louuS94ablN3BG/QQO/6LSU7jH2Jo1vRHH04FW6zkSj0Eh47goix23ncXQpUtkCrBMwZtINULBfAtxhBUYWSOfIr9e1/dVhw/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774933; c=relaxed/simple;
	bh=JPbEASCrM+OONjoFHisnRVpJb/9wB2vAgfPHiWJOh88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqL4uu+Uew0F3D3cWgeMSqoQwL7tmhq3I/PHBsO46Xmf1JnRANfIQoewnrTFCB+tGAYsIauWv8W1Vtk9rdtd5sJ5JIaIPNIse9I6hmsNh6Na9ucD+z6fkFk/ujNuhZkJAPZ32eTsn4N+UZE01UVElw9IgAFvyV4SkC760UJj8zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2HzVORn; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2HzVORn"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab37e44643so7493827b3.0
        for <dmaengine@vger.kernel.org>; Sun, 11 Oct 2026 20:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791774929; cv=none;
        d=google.com; s=arc-20260327;
        b=XE3tLLlx41FZ+4HXNH96UZwza1PICe/OyooRB9F5nuN2oIPzHfGimJfTviSS3CZyG/
         3h02UcwVsuRTxAslC8wCWXW5VaqitzuBaZyzYCZvUfPcr4dhg3nt8JT6IPOLrAQ9XdM6
         YJBsJ2LEB0kl51uvbyJbvTwT3tjBw49ojZHcb7LwiLYIFGIJxc/0WJlBmF5NculMUjCr
         e8w8LgUX9Zp098PrG4+1+Ck7sUQu3HlBzSnltakpcC/hpvEU6FMKSZxAWOUK2QR53vB0
         Y2gn/YhAVWtQ9O368kfwER0f8eTQzOBskf23SXY8dNLPorH8PiRdlGQNt8pfQAODtiX3
         nbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EibvpYrF7gekrtokC+ObXQgUiDJ9OK568BcwNigSZbI=;
        fh=Fz4kU6nW7V5uX2DQvPIdsylBfU26T393nGztyarhmZ0=;
        b=g6RXnK17EYl6LNAhhkR0f+uEIBdSLtYjrsoAE+mzxLn3DPGEGlRCu4xf8+rqYR3SjG
         twB6qRsxc2KMwDmrUR7VFV1NTayXs66OPP6d9IQPZREEjxPMIceP/YTz0CAJsscb/q4d
         AqNsdKxUFDBiVieIlIkCyAxVs8Z+fIS83EhYwG4BeQ452GpikYIcGAc8ko5EDnngSKBW
         kHpB8TWe+iIikBPPKZIGlbLqzp6r3aglZxOXMM++g6fcIj+T3c5pbkEW0JZ3uKh/VC5f
         ZlG2rHicV9rhc0T7dn81YmSxYUZHomTULgUq7ZZoLF9Z+Xb+yeFPHPPllogKmEXYDnlD
         fOig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791774929; x=1792379729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EibvpYrF7gekrtokC+ObXQgUiDJ9OK568BcwNigSZbI=;
        b=c2HzVORnt6R3mhdJTdOrWEkRfSLdp1K7tS9rlN98pivuGiYUhZe2DPv7jJKB7SH9Sb
         CCGGpqik1G0nCS7vg4Ste+O8ABok7dH7HCa7vZ4QlHkUNzvA7v6YQU+PIoUAE9FqdpO4
         J8xw1t05M7CbiZQMzC0No9+YBSqXvTAQENsQjV3Vg8Q49PBvlzJyjWDsXIXbgKrhK1hY
         /vip8E6GSSv4ryVrSw4XhsFG8L+vg3Lgg0ceK7BNWwOrIOjdNbr4FEl/ILbsfHsgNNMP
         e/Q8wCI1ZEarOZT+wPtdalvgupOLjLDyBFyKbUxs3SjedE3QTN5TNQWEFROUuwLonnNr
         ZRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791774929; x=1792379729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EibvpYrF7gekrtokC+ObXQgUiDJ9OK568BcwNigSZbI=;
        b=Jhbgu/GGBrCoRjZC0YEGvM/alYvKYhS5wjDksF+J4ohQS8dJC7p6wIEzhIVB6F1VYS
         fV7lTHlsaoqfrZqHB0h8I0zdx5WSlq4hWMppWX7q0+7bTu78x9vKLFcQ6iW1SIrzKaSx
         e1nqz4MAW6KtlJ/QP1dD2QskyHQ+KD3boO2yHMXb1MD/uN5IFE9OKWjXHNmFt4inma41
         +V2att5PgIJiNgu0sPtglVQYq0Un2ad0DI7I5ZM3S29fV9A3tzTXZnf8UgC+wmzNJ/lj
         yw5cvPKbd9UhAGkSBnz5TNAkMc+MbxwuvgvLbM6yYuisLiX4ucmWVqOjS6hlfFYE2BJd
         5ayw==
X-Forwarded-Encrypted: i=1; AKwUvByHHSJ9MxPRzLUiPE4C5emptONe60hfQBAFDCc+Cpml8BvFNH5UUxoDkY5BDk1vs/6DavJ+e9NG5tM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa3sGWatuSWr/OuIdy8iLTP/s98nMBCe+FhFqJV8nrvGdJdCjQ
	IbmDyJzpoaOxvknOajEPMLlcVZslVCVVrFGwJNJZDfMdMyF+0wGFC6uSQh/CEfjJcuwbL8AoOz4
	fzpoxPVvmjTmup+SqU/jueVN8uv3zPxA=
X-Gm-Gg: AYBFou0lTooKHSep+H56nhUuqjYFBrVD//UAmbA5hu67482JrqtQ2MIBiaF0eX2kk7x
	uY+Uo+Ce8MoCtjbw2pWkaCvFfn1zceWnmWNagUiL6R4Juaj03nDSbxHdzs9OIEOcaD51HR0kqc6
	fEQIMSwDu/aSoqkiEORckE5Q9spiVTRzhJopxjOzaFqiCD4stVdBaZn7rcrwPhPcjD7o5knYoQV
	pP5HZAr07hzFPH7fjsZSGRxchyzHtnH6BRvrckNUzcytUV2AxXPfQXofaYp7IH5MMZntPxCqUy2
	qvmRlcuUuE8JxypLqyv1PhSKuhlHPqHhm14oBBVVuuX5Tc24nbJKUmQ5
X-Received: by 2002:a05:690c:d85:b0:8b0:a08f:2ace with SMTP id
 00721157ae682-8b0a08f2c2cmr7475707b3.42.1791774929600; Sun, 11 Oct 2026
 20:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007150104.38253-1-ginger.jzllee@gmail.com> <asgJ5cVHQyiKFJo7@SMW015318>
In-Reply-To: <asgJ5cVHQyiKFJo7@SMW015318>
From: Ginger <ginger.jzllee@gmail.com>
Date: Mon, 12 Oct 2026 11:15:16 +0800
X-Gm-Features: AclHuK-vr3dMnOqUpjIwLAc1h27RiuyWSviI187f_H-THD8PLVmaey_0myGK6dQ
Message-ID: <CAGp+u1ZiGU6gqCT2kEZQK5ekEnwVFaOr0QrPYbP3YR4SF0UpqA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: pl330: Fix lock-order inversion in the channel
 release path
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 5:23=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Wed, Oct 07, 2026 at 11:01:04PM +0800, Ginger Li wrote:
> > [You don't often get email from ginger.jzllee@gmail.com. Learn why this=
 is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > pl330 uses two locks per transfer: the channel lock pch->lock and the
> > controller lock pl330->lock. My static analyzer reported that they can
>
>                                The static analyzer ....
>
> > be taken concurrently in opposite orders, leading to potential deadlock=
s.
> >
> > The terminate/stop paths take pch->lock first and then pl330->lock, e.g=
.
> >   pl330_terminate_all()
> >     -> spin_lock_irqsave(&pch->lock, flags);
> >     -> spin_lock(&pl330->lock);
> > and
> >   pl330_pause()
> >     -> spin_lock_irqsave(&pch->lock, flags);
> >     -> spin_lock(&pl330->lock);
> >
> > While on the other hand, the channel release path takes pl330->lock fir=
st
> > and then pch->lock in pl330_free_chan_resources():
> >   pl330_free_chan_resources()
> >     -> spin_lock_irqsave(&pl330->lock, flags);
> >     -> pl330_release_channel(pch->thread);
> >     -> dma_pl330_rqcb()
> >       -> spin_lock_irqsave(&pch->lock, flags);
> >
> > Freeing a channel (dma_release_channel() -> dma_chan_put() ->
> > pl330_free_chan_resources()) while another CPU is in pl330_terminate_al=
l()
> > or pl330_pause() on the same channel is therefore an ABBA deadlock: the
> > one thread spins on pl330->lock that the other holds, and vice versa.
>
> To here is enough. cut below message.
>
> >
> > Inspecting the driver code suggests the rule that dma_pl330_rqcb() must
> > not be called with pl330->lock held: pl330_dotask() and the callback
> > drain loop  in pl330_update() both releases pl330->lock before their
> > dma_pl330_rqcb() calls. Thus, pl330_release_channel() is expected
> > to follow the same manner.
> >
> > Let pl330_release_channel() manage pl330->lock itself and keep the two
> > dma_pl330_rqcb() calls outside the critical section, and stop holding
> > pl330->lock around the call in pl330_free_chan_resources().
> >
> > This was found by a static analyzer on Linux 7.3-rc4; it reported
> > DeadLock::AllLock (Certain) for
> >
> >     pl330_free_chan_resources() <-> pl330_terminate_all()
> >     pl330_free_chan_resources() <-> pl330_pause().
> >
> > Fixes: 91539eb1fda2 ("dmaengine: pl330: fix double lock")
> > Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> > ---
> >  drivers/dma/pl330.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -1805,16 +1805,32 @@
> >
> >  static void pl330_release_channel(struct pl330_thread *thrd)
> >  {
> > +       struct pl330_dmac *pl330;
> > +       unsigned long flags;
> > +
> >         if (!thrd || thrd->free)
> >                 return;
> >
> > +       pl330 =3D thrd->dmac;
> > +
> > +       spin_lock_irqsave(&pl330->lock, flags);
> >         _stop(thrd);
> > +       spin_unlock_irqrestore(&pl330->lock, flags);
>
> [1]
> >
> > +       /*
> > +        * dma_pl330_rqcb() takes the channel lock, which is acquired b=
efore
> > +        * pl330->lock on the terminate/pause/tx_status paths.  Calling=
 it with
> > +        * pl330->lock held would invert the lock order, so keep it out=
side the
> > +        * critical section
> > +        * pl330_update() already follow.
> > +        */
> >         dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABOR=
T);
> >         dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
> [2]
> >
> > +       spin_lock_irqsave(&pl330->lock, flags);
> >         _free_event(thrd, thrd->ev);
> >         thrd->free =3D true;
> > +       spin_unlock_irqrestore(&pl330->lock, flags);
>
> [3],
>
> how do you make sure it is safe to do 1, 2 and 3 without pl330->lock?
>

It seems that [2] is not strictly needed inside pl330->lock (e.g., pl330_do=
task
releases the lock before calling dma_pl330_rqcb()). However, if [1] and [3]=
 are
expected to run atomically, would the following change do? This fix keeps t=
he
original structure but moves the dma_pl330_rqcb() calls outside the critica=
l
section of pl330->lock.

Sincerely,
Ginger

---
 drivers/dma/pl330.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1803,15 +1803,33 @@ static inline void _free_event(struct
pl330_thread *thrd, int ev)
  pl330->events[ev] =3D -1;
 }

-static void pl330_release_channel(struct pl330_thread *thrd)
+static void pl330_release_channel(struct pl330_thread *thrd,
+  struct dma_pl330_desc **done_a,
+  struct dma_pl330_desc **done_b)
 {
+ *done_a =3D NULL;
+ *done_b =3D NULL;
+
  if (!thrd || thrd->free)
  return;

  _stop(thrd);

- dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
- dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);
+ *done_a =3D thrd->req[1 - thrd->lstenq].desc;
+ *done_b =3D thrd->req[thrd->lstenq].desc;

  _free_event(thrd, thrd->ev);
  thrd->free =3D true;
@@ -1993,12 +2011,15 @@ static int pl330_add(struct pl330_dmac *pl330)
 static int dmac_free_threads(struct pl330_dmac *pl330)
 {
  struct pl330_thread *thrd;
+ struct dma_pl330_desc *done_a, *done_b;
  int i;

  /* Release Channel threads */
  for (i =3D 0; i < pl330->pcfg.num_chan; i++) {
  thrd =3D &pl330->channels[i];
- pl330_release_channel(thrd);
+ pl330_release_channel(thrd, &done_a, &done_b);
+ dma_pl330_rqcb(done_a, PL330_ERR_ABORT);
+ dma_pl330_rqcb(done_b, PL330_ERR_ABORT);
  }

  /* Free memory */
@@ -2353,6 +2374,7 @@ static void pl330_free_chan_resources(struct
dma_chan *chan)
 {
  struct dma_pl330_chan *pch =3D to_pchan(chan);
  struct pl330_dmac *pl330 =3D pch->dmac;
+ struct dma_pl330_desc *done_a, *done_b;
  unsigned long flags;

  tasklet_kill(&pch->task);
@@ -2360,13 +2382,17 @@ static void pl330_free_chan_resources(struct
dma_chan *chan)
  pm_runtime_get_sync(pch->dmac->ddma.dev);
  spin_lock_irqsave(&pl330->lock, flags);

- pl330_release_channel(pch->thread);
+ /* The two callbacks take pch->lock, so they run after the unlock below. =
*/
+ pl330_release_channel(pch->thread, &done_a, &done_b);
  pch->thread =3D NULL;

  if (pch->cyclic)
  list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);

  spin_unlock_irqrestore(&pl330->lock, flags);
+
+ dma_pl330_rqcb(done_a, PL330_ERR_ABORT);
+ dma_pl330_rqcb(done_b, PL330_ERR_ABORT);
  pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
  pl330_unprep_slave_fifo(pch);
 }
--=20
2.43.0
