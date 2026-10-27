Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118559;
	b=1ZK0HKu4YYpx1tpR0ekispP+0AsdlawMFKoB8IqqCzkGaD6DoPnoY43ZHAzmcKxtjf1S
	 WortSTROoQveb42iuKCF2pIeGYq6wr3EYPWAxHShBS8rP2Iq/Nbn9wP5PJ2jsB50DYq1F
	 Ez2h1fDPSAz9drwOHxdJgJSB1RhBGvlmGRRSuRTBP6zf2Y445BxyS92dBOwUjpyaeIaJ/
	 vxCsgXpxI366pVHTNPHUmHGpJ2YDioIujCzvHL7n9rJ0CUzIU5no+OQkkXKmyP630/PqJ
	 +Ak3IAthBjKZtd93JC1PHEXOkNhhaVrMmmp1H224QpZh+aVyCheiNO/mXfWVhhCGcHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
	b=yYhJaZnMsDYb1E1Bqh3dxmR6cn0cxN0l8UoDqdd0tlemAxHs+zq/6Vt2N2V3HhtLq0TO
	 +qxsp1+wmExGjRzu4bQqaVBpH+ygV8KRiRXk8yFm0GLe95jKsWMubsSEDYKvqk0XevB8f
	 N0ian3ojrVnWZ/307tjy5CuJZO+QxscgFbK/lm1UBp5XcNOeSpxLVJcXHzyV4VCohO3IJ
	 EbBvvrWULgcCuEx5PzNeFKkBq5pw3YiKzaFCC/AJ+Fny2znIR3qHYGhhzdAyHjhmv6KlH
	 bFx1CB02FYO2mHZLh7uhAWg0SjpUdRX9IJXbsF4aRIEVoho60yTe3q+LNi4Pe2tvdDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeFRDuRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D42606A325
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 16:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D42606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeFRDuRK
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc365db987so2944188137.0
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 09:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118558; cv=none;
        d=google.com; s=arc-20260327;
        b=nd3jgraQS4735V2F33qTWAMfRHUhHAmhLoG3IUoArZmr5fPKusUTyXX0CD6HX0PJVJ
         6qW4/uJ59isPPsyS43BpQsoAXIJusXAeSQw8Z/bREd4gaNx6jQ7QvWaneBnyCq2TmUfz
         uLiXt2x8eheNL/PZc3gkeWj4jkNuWXcxrxNasBtpNuwPL7LksFeuMCrESMlcfHxhh5dR
         4fTbClw7+f76Bme56VnhJXumRCiVZjrn/Kf5O+t4iAZO3dE7KRsPd93ZxjZHjGRH8Elh
         vdQ/DgdyEOpAI7PPFVtddRpvqSKqrSoWeua79LmZC+g6uDXCVeABi05L5VOa7uE2xNlo
         7WOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
        fh=Hbit6XURW0UkP7TdUbRzuPHHtBYKAiYouaCxuRc0JdU=;
        b=ZcWqlAmnGhfUinSnk8XYiqrbQ3FUeFiATdPPUx00YN4tr/fWFhOfg5PilgT08zLM/H
         0okO+X3dLl8Agui9qakOsJGJ+phiSRbDKaWkmfBu2vVU8Fn1mMC5FGVa+0X+TP0TTuZ2
         XABW1Ghru7Jo2cq+rJ0Cn7+6cH86v3r5fQyAQW1Zja+fJZjb94e7IZ66n/VOi0ALDRYd
         FiFZrV6wNneFQ5VjSsgBATwRPhzyU14JlhZuQiPEucOrhsQvvlW9sJRxadDDQAbBHnCT
         XtlkT0iVJ0rCwVaLIzvO5kMqp4bkHVP3txP8v/a9bFYAOMdfqvH52lLBh+yNSdnx+cB/
         JteQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118558; x=1793723358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
        b=XeFRDuRKl3BFKAIBDzFN0d3Uukmo+InRhfcy82j5+l8Qaao3nHFGKpo0uOYYevn2GT
         lVKImdp+MBfRhLyBosQBL7giYOFKqv2R09iV5Xe+x28t4JnHRquXK6Kp8EANVwWNq/2w
         zhZxmGxRiC0LdEgBWBQBmw/qRx5mnsHy52bZCRFFbkzUDaE2u4xJ3OcEfo/u7sGUQ6AK
         18PN3JQST+K5pd1pd1xbd+tECh9O4bfgzKIcbkn+VYvk10XVfQ4jhIUHCxvdB+0o/4i5
         eMndD99v687c9q8V+18pnCnzj8PtLYod+xfO/R+ZflsImVUxzfLAeoTtmFcjH91sJJzB
         glxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118558; x=1793723358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo5vPLF6zP/RraszuGpsMvag6Tig15KjbqgR0fa8MIk=;
        b=nuwti++dcimrVclgXBwt5D9pBwyLlnRuzr8VJscCwJP3+EOHEf4D9u8gQHX4aNuecq
         4jQzO9Wo0q8zXIIdHWY7nEqnLky3IkWaKIRoU3tYKxvW5IRHhQlWT6azwzsDQGwuEDzo
         8FpWJdbQmzraYI1sugmROFqRXZxbEfY70bVwRvLjdWI7dFOpbv7CATkG7SGLM534+w7x
         3aG9N3ng4O7QzAFjLVa4Tqi0zm2ibR2FruMX6heT6N4b0KtnU+5+n1lPsiHb3FT422dm
         82EvPpoGcDQrWEQrwP8Wnh/x6V5l/2WAAQV0JFCYKVwmrEM4RNAqt7WH3Rsnrlq4TDks
         SfQA==
X-Forwarded-Encrypted: i=1; AKwUvBwyLAUcXFu6TP2zSHpPU6PqgsLvuNqF+JBjOFLBN/Hb7FioJDts7ePNt8yZRJtxC+klqXgsfGqacsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRBbxTFSR0PQ33t1kD7Tx60Xp+PPvPlSj3vZmHHk48/GPPLvax
	dYCj2iztPngQzXbjoDxX0FGDFmi9KqAQQkP8aQJXkTb/g60c63sOTmaCylXDjho2Tq9+2JtaaEt
	KY1OG5jsUiix6EGDhVokUYVbnkDjeEe4=
X-Gm-Gg: AYBFou226TZS473yUbkBolmWUq7wRdtBCACLFODNErLLozjEyZOYxON8FTk39Q5eoZC
	5tGa1u+YrNsDOOB5vF0R7zOg/pGQZyQpKV6qxqVb55qKOmfaLRB7xEOhxDJDu3RGv00Pekd8tyW
	0nq1f1NWXHvP2FBQu1JhGEg5aIagKdriUTOiCAJ1PHwXFyuUIJv5/TAUXwfwWH7lg7MJc7ThQ02
	Cz7ohzhPpE4oum9BfFDp8fhj65ELlkvWQ4nHBoRoL3BPgh5PfDUFKITiMCvXkmH6UWG+1LJfd3T
	VkA07sOEp056ZiiqVQbhMm7k8vF0TV3rFKV3dFrzZgtCKV7JrTXySjYLJXyHx3pZTAtAmBe6mDE
	c7TG9TJMxYGTfDRrppuvekLhMUED0pbBgZnUfPahZQ/cikK55RjIlcKtM3E9/zI5AbwJGjGX2CV
	m023QgcvwoUppTFuTjyKodDbH2tLeGzwKQPHVGoZJUkfGp2aiD4i7a3FGHQZCKsGmVH0vZM2jSF
	9H22hbjVV4/hFRT9CuIeI/cFRgEEQ==
X-Received: by 2002:a05:6102:689b:b0:7cc:21cd:9b68 with SMTP id
 ada2fe7eead31-7ce5cd17515mr3954626137.15.1793118558471; Tue, 27 Oct 2026
 09:29:18 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
 <sashiko-outbox-180707@kernel.org> <auDNkfOAqm0QJK6v@lizhi-Precision-Tower-5810>
In-Reply-To: <auDNkfOAqm0QJK6v@lizhi-Precision-Tower-5810>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 10:29:06 -0600
X-Gm-Features: AclHuK9WqKBRujgE8EoIZ0GDGunOU9AvFKNfnMoPkDelbyaNHY9DJ0rWGQKrblU
Message-ID: <CADvTj4qtg+xeWJTKk4nS681fk+-N0pbYuZXVb6rLZtapizfYXw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: dw: synchronize completion callbacks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, 
	vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:13=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 09:31:42PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] dmaengine: dw: tasklet_kill() in dwc_synchronize() drops share=
d tasklet runs
> > --
> >
> > commit 095fd30b59df2969f093996b0e32af6cace0812f
> > Author: James Hilliard <james.hilliard1@gmail.com>
> >
> > dmaengine: dw: synchronize completion callbacks
> >
> > This commit implements the device_synchronize callback for the DesignWa=
re DMA
> > controller by calling tasklet_kill() on the shared controller tasklet t=
o wait
> > for in-flight completion callbacks.
> >
> > > diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> > > index dd75f97a33b3d..eb3f5ce471a22 100644
> > > --- a/drivers/dma/dw/core.c
> > > +++ b/drivers/dma/dw/core.c
> > > @@ -965,6 +965,14 @@ static int dwc_terminate_all(struct dma_chan *ch=
an)
> > >     return 0;
> > >  }
> > >
> > > +static void dwc_synchronize(struct dma_chan *chan)
> > > +{
> > > +   struct dw_dma *dw =3D to_dw_dma(chan->device);
> > > +
> > > +   /* Callbacks run outside the channel lock in the controller taskl=
et. */
> > > +   tasklet_kill(&dw->tasklet);
> > > +}
> >
> > [Severity: High]
> > Can calling tasklet_kill() on the shared dw->tasklet here drop a concur=
rent
> > tasklet_schedule() from another active channel and leave controller
> > interrupts permanently masked?
>
> Is it true?

Yes, for v1. tasklet_kill() holds TASKLET_STATE_SCHED while waiting for
the running tasklet. After that tasklet re-enables the controller
interrupts, another channel can interrupt and mask them again. Its
tasklet_schedule() sees the bit already set and does not queue another
run. tasklet_kill() then clears the bit, leaving the interrupts masked
without a queued tasklet to re-enable them.

This is already addressed in v3, patch 4/4 [0], which uses
tasklet_disable()/tasklet_enable(). That waits for an executing tasklet
without consuming scheduling requests from other channels.

Termination removes the target channel=E2=80=99s descriptors from the share=
d
lists; synchronization then waits for any callbacks the tasklet already
owns. Clients must still exclude new submissions on that channel until
synchronization finishes.

[0] https://lore.kernel.org/r/20261023-submit-dw-dma-synchronize-v1-v3-4-c6=
2bf048f5ce@gmail.com/

>
> Frank
>
> >
> > In kernel/softirq.c, tasklet_action_common() clears TASKLET_STATE_SCHED
> > before invoking dw_dma_tasklet(). When dwc_synchronize() calls
> > tasklet_kill(), it acquires TASKLET_STATE_SCHED via wait_on_bit_lock(),
> > waits for TASKLET_STATE_RUN to clear in tasklet_unlock_wait(), and then
> > clears TASKLET_STATE_SCHED:
> >
> > kernel/softirq.c:tasklet_kill() {
> >     ...
> >     wait_on_bit_lock(&t->state, TASKLET_STATE_SCHED, TASK_UNINTERRUPTIB=
LE);
> >
> >     tasklet_unlock_wait(t);
> >     tasklet_clear_sched(t);
> > }
> >
> > While tasklet_kill() holds TASKLET_STATE_SCHED, dw_dma_tasklet() can fi=
nish
> > and re-enable MASK.XFER and MASK.ERROR across all channels before clear=
ing
> > TASKLET_STATE_RUN:
> >
> > drivers/dma/dw/core.c:dw_dma_tasklet() {
> >     ...
> >     /* Re-enable interrupts */
> >     channel_set_bit(dw, MASK.XFER, dw->all_chan_mask);
> >     channel_set_bit(dw, MASK.ERROR, dw->all_chan_mask);
> > }
> >
> > If dw_dma_interrupt() fires for another active channel while tasklet_ki=
ll()
> > still holds TASKLET_STATE_SCHED, the interrupt handler masks XFER, BLOC=
K,
> > and ERROR across all channels and calls tasklet_schedule(&dw->tasklet):
> >
> > drivers/dma/dw/core.c:dw_dma_interrupt() {
> >     ...
> >     channel_clear_bit(dw, MASK.XFER, dw->all_chan_mask);
> >     channel_clear_bit(dw, MASK.BLOCK, dw->all_chan_mask);
> >     channel_clear_bit(dw, MASK.ERROR, dw->all_chan_mask);
> >     ...
> >     tasklet_schedule(&dw->tasklet);
> > }
> >
> > Because TASKLET_STATE_SCHED is already set by tasklet_kill(),
> > tasklet_schedule() sees test_and_set_bit(TASKLET_STATE_SCHED, &t->state=
)
> > return true and skips __tasklet_schedule(). When tasklet_kill() then ca=
lls
> > tasklet_clear_sched(), the scheduled run is lost without dw->tasklet ev=
er
> > being queued, leaving MASK.XFER and MASK.ERROR disabled for the entire
> > controller.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-submit=
-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com?part=3D1
