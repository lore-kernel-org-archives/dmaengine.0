Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164969;
	b=b1K1UAs13a8K/Z1WZDeiMUvIwslBT3HSDDI3E0UwsFcPM9Qfiuty+l9gZ4VwB0Bm5i0p
	 d6nI/QMrJRszOS5I1AzrZm0T7DGK6u9+EgY5IWe4d5Z7a7f+6jDcktiiTSQFouBhgC0og
	 9FSXlQiXWF15RK3A8v6wBPWZwyEA3WcOyFIZlNlchzbCH355EOBgAau1+BidPW9cA9cw2
	 SS/QNmDtofrosFkNe1NRqDORrOheTFliJwkN0TMFwLdp+G7NgW2TeMRgmI2oBwT8hEmJl
	 UvQ1WrhQs3zBtdqGBD1FU1Pz4yd90BEU2IERHFPZ71NnNS1/wFyVkdUfiq5H4jQxApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164969;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=90XhFyxRpZHtb7tM1LMctdqQWB2+XYdbnjQB7kap49Y=;
	b=E2AW/ZPq5866noXyoO0Kvg+sFcros5enAGqolGDNk0atIF1/HdhEF1P1HB4ID+RG+AcS
	 BDX8uzpPm3qXH6XnJD+hWCk5vU1F/Mc4HxqkoG5owh5S91zQ0utcEeGL9T5aEfFKmjnmO
	 4HIgyAqb+LhLq0QZ1U0CD7pURFyZGees1DPeVf7giBpNjXm6ff1CEhw+fnvqZvZM9xKww
	 coN2VrIItbS+Uv0nFNuC+WTG3VuyUWV8P8ziW/uN/UxIZj1VH5T2ZmvdbuRZvSVJDKBqs
	 7+HYdRFX7Vo7pI4rHosxZ6Wc7huanefT4z1uuyFskLc4zCE9Dvgxto9UsfNVfA3VSlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfZ0So7Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43688606A326;
	Fri, 20 Nov 2026 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfZ0So7Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150821F000D0;
	Fri, 20 Nov 2026 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164968;
	bh=90XhFyxRpZHtb7tM1LMctdqQWB2+XYdbnjQB7kap49Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BfZ0So7YFGZW4PHE7hKo4jGGiwqMtyh7u7Ikir1vGEVbl+hQxNMHPC+51kiUkOmet
	 c9LdU+m4+O16xcsAyohLjMSWAQ7svDsId8zBnQkses9npzEcUfsz6nbS0EIcDLhjNL
	 zjn/xoCULDYxKs3fXLX5hgoEWJhhDQzQr1KOlux0fNw35bI4rx0cxsv1eDw/O+y65K
	 2qdu+9Bd/yPmK8ELVRfmtaYQxNuQljgO82b10T5MkHz+hFd30lYYUuKJKp1eT7lzzX
	 TIQ3MDSGgixOwUCRFZGKr/Icjqwm1XUazzxboRQTZL2TB5yFeqy3Q8V6x7qq1GjTeq
	 UijsFkNys7d5g==
Date: Fri, 20 Nov 2026 14:26:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen <allen.lkml@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev,
	dmaengine@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v4 02/33] dmaengine: back channel BH helpers with WQ_BH
Message-ID: <awALJBGCtHvZuJnh@parshuram>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
 <sashiko-outbox-207180@kernel.org>
 <avt4PU04jy8a4e_i@SMW015318>
 <CAOMdWS++nM+r8G+YUj-hk48KKvYH23yv2f-4X9C5F6n+KZqJ+w@mail.gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWS++nM+r8G+YUj-hk48KKvYH23yv2f-4X9C5F6n+KZqJ+w@mail.gmail.com>

On 19-11-26, 22:42, Allen wrote:

> > > [Severity: High]
> > > Can dmaengine_kill_bh() return with chan->bh_work still queued on the
> > > workqueue?
> > >
> > > Unlike tasklet_kill(), which holds TASKLET_STATE_SCHED while waiting for a
> > > running tasklet to finish so concurrent tasklet_schedule() calls cannot
> > > re-queue it, process_one_work() clears WORK_STRUCT_PENDING_BIT before
> > > invoking dma_chan_bh_entry().  When flush_work() runs while chan->bh_work is
> > > executing, insert_wq_barrier() places the flush barrier on worker->scheduled,
> > > ahead of pool->worklist:
> > >
> >
> > Can you check this one?
> 
>   I have a fix which I am validating, and will post it in a day.

Thanks, I would like to pick it for this cycle...

There are few more sashiko issues on drivers, can you look at these as
well please


-- 
~Vinod
