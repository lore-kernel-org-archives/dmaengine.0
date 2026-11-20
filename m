Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153361;
	b=GV3/E3Etyjgg1iQVWudzOgOKwZ0w8wsqAeyZtsF6Qmx2nbZ3Ij50WOKtE8voWnjKZhj5
	 Q44ReM3lXRFI9p/sXcXz18EUPi7/9HbYxBhd5N9/Me5duRzi/vBn5vcCwjiKhrXnkeYHw
	 hbbkdTrzNCKxWjmI8HMK4YPVeeADm9DosM62W1veTJqFN4Hz5ibOlVtXPBwVIyKInMeZW
	 3wo7KVb496R7hbemJSWkEfIJBiuBeyiFG+me/mz4cPodGRCOXXgOvl+bdEFWSrUF8eEZ0
	 FdnefN5KTDZYcBSALli/phP4cRfTx4y3WYrr7yaMKcVSYolm3+5WHn02Gt6jWcic0lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
	b=NLzK5AYndOnVOT3kBguD61VAkbeDf75oEwms12CJu7bJUIvv/pY43TZETgJUK7e9b1cL
	 yBnq0aAVkJKAtLM9WVLwOF4gjNUJcf//3YhZd6pPhqliJwa3jZFoHgQPzb/kX6eqMxK1O
	 3W63CjMHO/970GoswNFy3xG60BBjvCyTQxf+NKHQBTCvkFq+qrmLvIcWAjlvTm4UQ+923
	 KKsHh9236M9bSWMuqUz83+9vZQKKZO5a9gbPCZiGpCpw7bfzV49pcwjNv+W8YBXbjIsBr
	 0Kixu7447AS6tiWwJ20o4EJ5PyB71oU+kx4y4/GIrVf6f1QmVbKCg7sUGvDlqUz81Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8Pay2JW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60543606A325
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 05:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60543606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8Pay2JW
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so346556a91.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 21:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795153361; cv=none;
        d=google.com; s=arc-20260327;
        b=FguEvaK4Vk0eXKi9EUDkDioUAgfENBqKabVkMY55wQQ/WMSbHpdpHvvFfNjIpHXhAr
         nUQfk++eDJKuwWDw1CVoeQHan0pZV00MlaQZ+e9BarVr6GF7ht2czwh4y5TevyFcVlFN
         sVkYkiBSwVxygdkMXEz0MxXBtNdLGeD2gYtRJSUjDBjmZMjBeuGs0pJhdZMkgatHhmND
         nCJ6fkNHc4VEooV/mr0UTiOTbG1zxU02gYvYdtkSbVU9CiBd4/I5eOMSxudHSA7F6cZZ
         K2YwDlwNijMUjqMy2yARmrtaisSijdNlw15focnlwNtaYBnXc4ipVQm9gEFBK9hxE7ql
         lvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
        fh=go+VPJt0tEz76vE2GRmu7Qw1UGWkenG0XYiABaXtN5s=;
        b=RgFKt6rhHJl/GhiBdOuAcwk+IdAaHCOL4hdmdZ0n6dOU2jN2neZB0WRSEmuTrxMYES
         tMUZV1cYdDfLkMIX0zkd+JBa7rMlxZeNcEmWjHkCKBDw41lUg22BsAAKOkw5RHpMEa/0
         f/VkmoKDYx2vaw7jN21dJjgY0v254697s1Q/pauuomiBL+zVHDDbkQwMaakUGEM5hcvy
         gMlQ4frnBXMrNEb694Atflr2eRnr7vgHxPvMxXlkvfM1rAIlwe/tB6b1Aw+3G2+cA7OS
         V1aMwusO+htslfpZzrjY/siqmEkKi+yAJehcisX1paYWqQBMam7roucAeCyXQtI0LQPg
         PsYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153361; x=1795758161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
        b=t8Pay2JWg7SW/hJDfwPJr+1XydfJJXmvZiY5H4hT/JUCx8ZvZnqBiOL6uQ7SdKyXFx
         VM6LOzLQKIV6ABC7+tCXDYqzAS585HBJEmZIngdPQfqKNlVrarqFRgkxtgq7ibzLM0jj
         BDTBoRlZ8G0CqUveUPps/jUk7+Nqgqd+iuSk8pEac/G2dgi3I7FES0EEPg4tey98kEDH
         FQh7PxvpcyXdKa7EIXFfQ5mYvGs9uYB74/Zw1QGE8xDnVIfrri1p7yZbZeL+Cwas/M+4
         2DQVjrlXwBXm96NeiP1y7aoqZJFu9C9nWCtHHA3c3ki0I6z7D3Uujgly4N5xBarFp8Kh
         vs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153361; x=1795758161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qjgGXuBHBLvMHrjXiMEeKTNvTNqRqMclyrqR/WfruA=;
        b=2LVCreL+anI7Z/ajePFAuetmm/4oAPvenqMuqrZ3KM8jForlA9myT94zqC/IFE15EK
         odHeq1eoZ3wo3CgnPThL9QNLN/ebXgH5KrWfpmGO47BmPrtFcC7M4R4fe1ko3+MhvzpO
         u7VWUkJdblpjtbfUMqZQ3V0Gt4xLnDiURAs0nWNp6WhwgQJnSVz9XpuQiff57fIpxyzg
         Zri5tqcQdsN6CtG/jpahjLp+YKmQ+w2zmoXVVPNq2iKSTRf8US0qsug2rG17IR5I967h
         p9R2qhJVoFK606/OJ+5MS2HO04OIveuJz8JbPjiEsvhBoL5Uhf0P0fTipAE9wR7dBWRA
         nLoA==
X-Forwarded-Encrypted: i=1; AL+hErFzle2h/hDCOpnjSRgWk7EIC92bRRoAZt4lPFJMa+qT7AChkGhxAoYc5CrjxIXZCw9gBC+WUTIldTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z91wZ2SWo2HWaRjDjLlpipeBTeuAuFsy7RG3LaMui7y7sNUNkLg
	XQlz7aUs+adXLdPjAUlyN65Rbdc2ZZVUeOJmycPHClBqjjTkQkDGdqppewVD5Q7hOCur4k+AM+3
	Pr0tEAH0e/IETR6YMogqPMPHkAMRCnqA=
X-Gm-Gg: AZFdTZfcnry+s+Koc06J8+JoFsXeD10oTnKhPEv2OpIfB0RMrf+ZZRDZzf8QQrLjC/h
	wGvk9+ER2NQS9Ngk9A8/gcawz5yriNgkzcP49cQmq7Dgh55Y+xFmGmakwFXWWji31ho2ROBfIfb
	r5wQUtHIAQoM/AGgJwodUjbVEMOMN8bj8Lf9B9JwZLvY+/+10TS2aeoAJTUJv+Y8+N7GRUSxwQu
	BkwIJmFG9RdM2FR79bIphNdwxe4Gev6DxzDA34+GtjdW0RUhpsTDopys3X+5LV/0vUQkZiVwYyj
	JMxFkPywCDhn7rEOClpWrn//4g50xaENZicRpjO36okw1+8MyCOqCc6ho2c2AuUaNzUS9uU4i7W
	XIwFpBMZlxoy89Nc062rDQlWqvALgyHXx4eG3dwoEXn6CQvwiRsz/6OvJlVZNbpoP5fgP8Co=
X-Received: by 2002:a17:90b:50:b0:3b0:9e2c:9b5f with SMTP id
 98e67ed59e1d1-3b41c7b6044mr1574916a91.2.1795153360678; Thu, 19 Nov 2026
 21:42:40 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794315350.git.allen.lkml@gmail.com> <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
 <sashiko-outbox-207180@kernel.org> <avt4PU04jy8a4e_i@SMW015318>
In-Reply-To: <avt4PU04jy8a4e_i@SMW015318>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 19 Nov 2026 22:42:26 -0700
X-Gm-Features: AclHuK9-2Bsk_aSPveBTWccQ93xL5tYOvp8iXytO_p3NzhyIMiI8TSBO85p9bjE
Message-ID: <CAOMdWS++nM+r8G+YUj-hk48KKvYH23yv2f-4X9C5F6n+KZqJ+w@mail.gmail.com>
Subject: Re: [PATCH v4 02/33] dmaengine: back channel BH helpers with WQ_BH
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, 
	vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Tue, Nov 10, 2026 at 02:15:38PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [High] dmaengine: dmaengine_kill_bh() returns with bh_work still
> >   queued on re-schedule
> > - [Medium] dmaengine: flush_work() in dmaengine_kill_bh() triggers flus=
h
> >   dependency warn
> > --
> >
> > commit e183b161b65ac0da135cdea21e6916bb3483d703
> > Author: Allen Pais <allen.lkml@gmail.com>
> >
> > dmaengine: back channel BH helpers with WQ_BH
> >
> > This commit replaces the per-channel BH tasklet implementation with a
> > dedicated WQ_BH | WQ_PERCPU workqueue while keeping the dmaengine_*_bh(=
) API
> > unchanged.
> >
> > > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > > index f3c1283b161b6..97d8f9667ae5f 100644
> > > --- a/drivers/dma/dmaengine.c
> > > +++ b/drivers/dma/dmaengine.c
> > [ ... ]
> > > @@ -1449,9 +1451,34 @@ static void dmaengine_destroy_unmap_pool(void)
> > [ ... ]
> > > +static void dmaengine_flush_bh_work(struct work_struct *work)
> > > +{
> > > +   if (!work)
> > > +           return;
> > > +
> > > +   flush_work(work);
> > > +}
> > > +
> > > +static void dma_chan_bh_entry(struct work_struct *work)
> > > +{
> > > +   struct dma_chan *chan =3D container_of(work, struct dma_chan, bh_=
work);
> > >     dmaengine_bh_work_fn fn =3D READ_ONCE(chan->bh_work_fn);
> > >
> > >     if (fn)
> > > @@ -1467,7 +1494,7 @@ void dmaengine_init_bh(struct dma_chan *chan, d=
maengine_bh_work_fn fn)
> > [ ... ]
> > > @@ -1487,7 +1513,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
> > >     if (!chan->bh_work_initialized)
> > >             return;
> > >
> > > -   tasklet_kill(&chan->bh_tasklet);
> > > +   dmaengine_flush_bh_work(&chan->bh_work);
> > >  }
> > >  EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
> >
> > [Severity: High]
> > Can dmaengine_kill_bh() return with chan->bh_work still queued on the
> > workqueue?
> >
> > Unlike tasklet_kill(), which holds TASKLET_STATE_SCHED while waiting fo=
r a
> > running tasklet to finish so concurrent tasklet_schedule() calls cannot
> > re-queue it, process_one_work() clears WORK_STRUCT_PENDING_BIT before
> > invoking dma_chan_bh_entry().  When flush_work() runs while chan->bh_wo=
rk is
> > executing, insert_wq_barrier() places the flush barrier on worker->sche=
duled,
> > ahead of pool->worklist:
> >
>
> Can you check this one?

  I have a fix which I am validating, and will post it in a day.

Thanks,
Allen

>
> Frank
>
> > CPU0                                  CPU1 (bh_worker)
> >                                       process_one_work(&chan->bh_work)
> >                                         set_work_pool_and_clear_pending=
()
> >                                         dma_chan_bh_entry()
> > dmaengine_kill_bh(chan)
> >   flush_work(&chan->bh_work)
> >     insert_wq_barrier()
> >                                           ...
> >                                             dmaengine_schedule_bh(chan)
> >                                               queue_work(..., &chan->bh=
_work)
> >                                         /* dma_chan_bh_entry() returns =
*/
> >                                       process_scheduled_works()
> >                                         /* runs barrier from
> >                                          * worker->scheduled */
> >   /* flush_work() returns */
> > kfree(chan)
> >                                       /* processes pool->worklist */
> >                                       dma_chan_bh_entry()
> >                                         chan->bh_work_fn  <-- use-after=
-free
> >
> > This is a regression when chan->bh_work is re-queued while
> > dma_chan_bh_entry() is running, for example when a BH callback reschedu=
les
> > itself (such as dma_tasklet() in ste_dma40 or mv_chan_slot_cleanup() in
> > mv_xor) or when a driver calls dmaengine_kill_bh() before tearing down =
its
> > IRQ or timer (such as mtk_cqdma_remove() or tegra_adma_free_chan_resour=
ces()).
> > Using cancel_work_sync(&chan->bh_work) or disable_work_sync(&chan->bh_w=
ork)
> > depending on whether the channel may be used again would wait for any
> > in-flight execution while preventing or draining concurrent re-schedule=
s.
> >
> > > @@ -1687,15 +1713,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
> > >
> > >  static int __init dma_bus_init(void)
> > >  {
> > > -   int err =3D dmaengine_init_unmap_pool();
> > > +   int err;
> > >
> > > +   dmaengine_bh_wq =3D alloc_workqueue("dmaengine_bh",
> > > +                                     WQ_BH | WQ_PERCPU, 0);
> >
> > [Severity: Medium]
> > Does calling dmaengine_kill_bh() from a WQ_MEM_RECLAIM workqueue or a
> > PF_MEMALLOC task trigger a WARN_ONCE() in check_flush_dependency()?
> >
> > dmaengine_bh_wq does not have WQ_MEM_RECLAIM set (and WQ_BH workqueues =
cannot
> > set WQ_MEM_RECLAIM).  Because dmaengine_kill_bh() calls flush_work(), w=
hich
> > passes from_cancel =3D false to __flush_work() -> check_flush_dependenc=
y(),
> > flushing a pending or running chan->bh_work from a WQ_MEM_RECLAIM conte=
xt
> > hits the dependency warning:
> >
> > kernel/workqueue.c:check_flush_dependency() {
> >       if (from_cancel || target_wq->flags & WQ_MEM_RECLAIM)
> >               return;
> >
> >       WARN_ONCE(current->flags & PF_MEMALLOC, ...);
> >       WARN_ONCE((worker && ((worker->current_pwq->wq->flags &
> >                              (WQ_MEM_RECLAIM | __WQ_LEGACY)) =3D=3D WQ_=
MEM_RECLAIM)), ...);
> > }
> >
> > For example, sdhci allocates host->complete_wq with WQ_MEM_RECLAIM and =
runs
> > sdhci_complete_work() -> sdhci_request_done() -> dmaengine_terminate_sy=
nc()
> > -> dmaengine_synchronize() -> vchan_synchronize() -> dmaengine_kill_bh(=
).
> > Using cancel_work_sync() or disable_work_sync() in dmaengine_kill_bh() =
sets
> > from_cancel =3D true and avoids this warning.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.179431535=
0.git.allen.lkml@gmail.com?part=3D2



--
       - Allen
