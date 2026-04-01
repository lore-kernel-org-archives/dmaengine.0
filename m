Received: from fsn-vps-1.bereza.email (fsn-vps-1.bereza.email [162.55.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6039A073;
	Wed,  1 Apr 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.44.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032065; cv=none; b=QW3ZUxXEPM9MVFAdonqTxC8Ee1eUzaPI4zpb5WDUCevrVHW0FS8REaVEOf0DY9V3lBfwj7KC5Aj2OgkwG9b26LS1Z41Oxzf4g4vo6/W5rGlKLnRfR6HMnCkBYwqLTk11N9jVi93zZYqK0jKzvqzzUQQb86wd0t8FsKM9OqptU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032065; c=relaxed/simple;
	bh=+K3p909lQJp4qb4sPAC49UNQHhnygwyrcg82WmuyFaE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BQOkqcFaHZ7sToAMwXJbK4Nx0uOI3TEV5sueg73JrJdQPoWywwg1ZiTpNH4TrWbjOi5g5k9t6zeIhbDhrdDfn5mrp948oveTyjj1oKvCm1Zb0RUs99/7dZBhh5JXIgKLGhsOYEwW+96/Lm+HTgVa2ALEDDp/ojEh5UlHzALaKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email; spf=pass smtp.mailfrom=bereza.email; dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b=fuMZdP5U; arc=none smtp.client-ip=162.55.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bereza.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b="fuMZdP5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775032061; bh=+K3p909lQJp4qb4sPAC49UNQHhnygwyrcg82WmuyFaE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fuMZdP5UJWf0uN9V7Zqnhhj1E6gHRVyZrdxyNqIRcQlAWGwNBsjHhl8M7/Ls6j0qU
	 FrRsymOnPJ2T4VTApd8UfdMbnlFk+RPL7eoOU23IRTL3mNJsfgXYz7BBk8zc/5som0
	 mvbDIW6qH9ZTpYmZ9XfvmeDbGFYPTDKoKKKNUCXMcOkZCD9wo6y534ts5JQGShiJdR
	 whg4Lwj68Dd/I6ZUwUyenb1X21LU9bFHKj2T9J0uGKqbVYFQNbefa6DwkCg+6LMbJg
	 M3qTsnCgFdkhZ+qTqi4VuueGTfQ8heauNbL3vdlbmrbs/GVu/vqlNaSGTvSeh9Um16
	 B9hZdF6HML5Mw==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 316CB5DF94;
	Wed,  1 Apr 2026 10:27:41 +0200 (CEST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 10:27:40 +0200
Message-Id: <DHHOCNHDN27K.RIE745OFAACD@bereza.email>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix CPU stall in
 xilinx_dma_poll_timeout
From: "Alex Bereza" <alex@bereza.email>
To: "Gupta, Suraj" <suraj.gupta2@amd.com>, "Alex Bereza"
 <alex@bereza.email>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Tony Lindgren"
 <tony@atomide.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email> <vA8GpbivDeKzKN1k0B6m1cvW-rZwJjKzvhksYdUJPo4fsfhLQoXtWoK59V1YX_U2U3jcVR2PAmzrleamvq8Dmw==@protonmail.internalid> <833bb42a-65b8-4c93-8109-d2959f8b807f@amd.com>
In-Reply-To: <833bb42a-65b8-4c93-8109-d2959f8b807f@amd.com>

On Wed Apr 1, 2026 at 7:23 AM CEST, Suraj Gupta wrote:

>> Rename XILINX_DMA_LOOP_COUNT to XILINX_DMA_POLL_TIMEOUT_US because the
>> former is incorrect. It is a timeout value for polling various register
>> bits in microseconds. It is not a loop count. Add a constant
>> XILINX_DMA_POLL_DELAY_US for delay_us value.
>
> Please split this change in a new patch.

Ok, will send a v2.

>> Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeou=
t_atomic()")
>
> This patch doesn't fixes anything in iopoll, please use correct fixes tag=
.

Ok, but I'm not sure what would be the correct fixes tag then? I though I n=
eed to reference
7349a69cf312 in fixes tag because this is the actual change that surfaced t=
he CPU stall issue that I
want to fix in this driver. I'm fixing the call sites of xilinx_dma_poll_ti=
meout but they were added
in different commits. Should I add all of them? That would be the following=
 then:

Fixes: 9495f2648287 ("dmaengine: xilinx_vdma: Use readl_poll_timeout instea=
d of do while loop's")
Fixes: 676f9c26c330 ("dmaengine: xilinx: fix device_terminate_all() callbac=
k for AXI CDMA")

Three call sites with delay_us=3D0 were first introduced by 9495f2648287, t=
hen 676f9c26c330 added the
fourth call site when introducing xilinx_cdma_stop_transfer (probably copy =
paste from
xilinx_dma_stop_transfer). Would adding these two fixes tags be correct?

>> Hi, in addition to this patch I also have a question: what is the point
>> of atomically polling for the HALTED or IDLE bit in the stop_transfer
>> functions? Does device_terminate_all really need to be callable from
>> atomic context? If not, one could switch to polling non-atomically and
>> avoid burning CPU cycles.
>>
>
> dmaengine_terminate_async(), which directly calls device_terminate_all
> can be called from atomic context.

Right, thanks! Just for my understanding: I still think there is potential =
for improvement, because
from my understanding it would be beneficial to do the waiting for the bits=
 in the status register
and the freeing of descriptors in xilinx_dma_synchronize. Do I understand c=
orrectly that this is
currently not possible due to how the DMA engine API is structured? To make=
 this possible I think
the deprecated dmaengine_terminate_all would have to be removed and all use=
rs of this API would have
to be adapted accordingly, correct? So this would be a patch of much larger=
 scope than xilinx_dma
driver alone.
