Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1413382E8;
	Wed, 29 Apr 2026 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447393; cv=none; b=CaeC2B/IX0hd9efLo9Rn+PIJ6caZnn5s4qxgqlkx5Csr4hEbXInSPohRcv20zO7bqKrqvoHyENTMJEUibuAc5SdCOqX4jyP5rjGrirRlG2SxiJXfhjzxzGeHFezjavikgKk1ovKGaqX+EXoBPacN4qp9yL2YIM84aWYRWb8hANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447393; c=relaxed/simple;
	bh=1ssGSorAy5PoaEeCfmBtER31TLfuEAHQUOeK/X2bdfM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gQzZgiisVtweAwfaKTRhAJfhtkqJ7Yl7TjIa3Nt0Pe3xtwqFbkWd7qfRcpwHYgVqgT7tm2vFwnSNLNJ1mKPSuLsu+DhJbgeEKebwk5DeqdxVGLdKcbPZhVsKs+XAB7yU0qOTTQ/qAb5go4ntNV8Stj7z8G/WObEzTz7XeyYW1bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKfwvM/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKfwvM/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33A9C19425;
	Wed, 29 Apr 2026 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447392;
	bh=1ssGSorAy5PoaEeCfmBtER31TLfuEAHQUOeK/X2bdfM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UKfwvM/4STLtb8fTT+oC69eYHq480Cz5vn8K/VNR5HaP8Di49riqaniYP6sDQZ4xK
	 LH/StJbUPx9cn934vDpMXRtZOWYdltYPHmC0G2TsCl0a2K5uESZ9l1vpfafmSYPMgn
	 JKPXbgViBd1UL4LrZrCCRVK4c5/774M4SQX2eZgFV45PHu3YPTNc3gnsvGcXI1gycR
	 5eGeDVF09ntDek6F7LYD2jOhL+Vew3nvv79IWSXdLKsKi8PJmpPbuey9k72+5hKZdW
	 KmqdmFcr/tYzaOSRgBpcpahmY+Qac4wgznPTg0hBl17484+r/CUcHx6Xhbt47F8JJt
	 Cq2gWrfYNXqeA==
From: Thomas Gleixner <tglx@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Vinod Koul
 <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Biju Das
 <biju.das.jz@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Cosmin Tanislav
 <cosmin-gabriel.tanislav.xa@renesas.com>, john.madieu@gmail.com,
 linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCh v3 1/2] irqchip/renesas-rzv2h: Add DMA ACK signal
 routing support
In-Reply-To: <20260402162212.12016-2-john.madieu.xa@bp.renesas.com>
References: <20260402162212.12016-1-john.madieu.xa@bp.renesas.com>
 <20260402162212.12016-2-john.madieu.xa@bp.renesas.com>
Date: Wed, 29 Apr 2026 09:23:08 +0200
Message-ID: <87qznyxmar.ffs@tglx>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 02 2026 at 18:22, John Madieu wrote:
> Some peripherals on RZ/G3E SoCs (SSIU, SPDIF, SCU/SRC, DVC) require
> explicit ACK signal routing through the ICU via the ICU_DMACKSELk
> registers for level-based DMA handshaking.
>
> Add rzv2h_icu_register_dma_ack() to configure ICU_DMACKSELk, routing
> a DMAC channel's ACK signal to the specified peripheral.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Assuming this goes through the DMA tree:

Acked-by: Thomas Gleixner <tglx@kernel.org>
