Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6A23438B2;
	Thu, 11 Jun 2026 05:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157085; cv=none; b=vAxfwD9MyBd6JgI0Ba+8glKLzLNIbM8B72c1WkHBXjc53Rg/Mt0QH/YRCZ0A8R+HvkZfxF0WG/dxmaDyV2FzaQ5FZorKPAKDyuTb0j7KBI1pOt3luVZCV9VXVp3efwXO4fsY2KYbS4mMeDqUKZ6y6IFz1ZwHWIDhRlFc4id0pTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157085; c=relaxed/simple;
	bh=mHqD9kbqB9tdpUVGVwEvT1aXqtKw9eGhM0fwxH437zY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HalnHXhUTajqVeHKmkZtRnMo2afED2fOeZ651jXEr4XnRF2YnrUWS7d13aXhZtQgigrH84QaF/SjByjgQDEehmBfDkjzCrjHiQ0d7+jfRQjAyDSE4Yy+NMXQsPGZ52TQpUIMg2vkU9goNTIXXoZSb2sXmGrzbvDqU5WBA1itXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbukiXBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbukiXBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C43D1F00893;
	Thu, 11 Jun 2026 05:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157083;
	bh=2mQkQRVDaMiG0OkxoW8ZDHtdNWrakfqp4WBmytLUzXs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nbukiXBPFLaa2AKzel+Jor0nK6Bzr0sFzOYt+OhrN2Wo058w+WG3ojlZiIW4vdD6y
	 6s6ptUmD5p0WMrJ2EtzmdBBM5bRDxjBeBBuXfMzF/IbqOgRlECEwbhR2mcf5hA5CGb
	 bW6ZQeuYIzF0qZLrIz6qAKaofKqBVEEVYXdm5h5rrKPF6JUJOaoM7Q475IXIx4ta3s
	 RBfX72B/LG5eFRkOtnFhmxNwQWajb6U7KR9jJ3/U3NN7O7g0IYGBtx4RxCTWo3hBcr
	 7XvJmG42njXi2Wjfe2pMcVeLVnnPiMfpDpACv+qbYXEzkM5HN8zA50KvnEgh03smJJ
	 17Q608w6YK1tg==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tze.yee.ng@altera.com
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <cover.1779688569.git.tze.yee.ng@altera.com>
References: <cover.1779688569.git.tze.yee.ng@altera.com>
Subject: Re: [PATCH v2 0/2] dmaengine: dw-axi-dmac: clean up DMAC enable
 and PM
Message-Id: <178115708122.468137.13715436835140429411.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:21 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 25 May 2026 00:10:20 -0700, tze.yee.ng@altera.com wrote:
> The DesignWare AXI DMAC driver enables the controller in axi_dma_resume(),
> which is invoked from the runtime PM resume path and from probe. Calling
> axi_dma_enable() again at the start of every block transfer is redundant
> on the normal path.
> 
> That extra call had also masked a gap in system-sleep power management:
> with only runtime PM callbacks registered, a channel could remain allocated
> across suspend/resume while the runtime usage count stayed non-zero and
> axi_dma_runtime_resume() was not run, leaving DMAC_CFG and clocks out of
> sync with software state. Removing the per-transfer enable without fixing
> PM would make that scenario more visible.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: dw-axi-dmac: drop redundant DMAC enable in block start
      commit: dc6d681e1571c89cd38145926fb2513d70a633e1
[2/2] dmaengine: dw-axi-dmac: fix PM for system sleep and channel alloc
      commit: df0c2dc68770cf43f15df40b184df030b850ea05

Best regards,
-- 
~Vinod


