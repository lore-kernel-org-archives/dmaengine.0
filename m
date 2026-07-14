Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB933F2109;
	Tue, 14 Jul 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019988; cv=none; b=BMryXhL14/kc8nhTXhYbNVjO1iIWIhAt4hFXAiU+xfq6ozWh+M1nAGcVPriFi0nIFDD6RRMW0ublHlGZvj59TmoI+xWK2XnVCBYkxQvuYS8mQp8kibgpzOzMoYILbfSjoD73vQRxR/BSvVCj5iJ2hAbOpmYzcBgSqA7+IUcaHaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019988; c=relaxed/simple;
	bh=GY14zh/my075SNbA1L2uLH1RSCRv9L5xm5DFIfu2uhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWadgpTOt9hygHrAqVWtYLF2REa+w/R0f59aqWXdoGEz9MGSm8It6eZdZp19cMNsJdUfrxTeAKictvkRzz/+zvJRSPeQa5F4qg67Itlx1/2l2ncFYa9uIdqg49Z14Hju7KNFXUH0M5rMt4V7BlZLi5zf31izEYjh879Nt8VYg4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRdqX2/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRdqX2/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150021F000E9;
	Tue, 14 Jul 2026 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784019987;
	bh=BfXRK1IPIAsjAFqmpmhhdLhhp42aSKoS7MLm5BuZBxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XRdqX2/u2Bm2dY1A5iy3D13tHeEDj0ls+cX4HEmK7fUGBvaVAZ8gmMyqfMCviuWH8
	 vzSgwydbkxOpjs/yDSZITVrzlzVSa6MCqsBd4Vv/k2nh55FcjxUa6EBwxPcDY/oXFT
	 Z4ZzZwLVjtZsRaOL1USIJbPzZd0lsqJHfyP8SNBxAkrCgvQzFuKMGx2eTvyzLvfUb6
	 GbUO578XHvYLFXU3WB0yj9xJl8szzFx2XKPG8e5jD3petdXJK0S4ttQriDFwgzSvxn
	 oqoLbc/4mcwCWh5+KVCOQfewDrkn/QqB/ZE3wlEi/ycQ2NWTSPA/1kEb2D4Rk0gDR6
	 jlftdsfZRNylw==
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] riscv: dts: spacemit: Use symbolic PDMA request numbers on K1
Date: Tue, 14 Jul 2026 09:06:20 +0000
Message-ID: <178401990255.1566747.5241634632803101071.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
References: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 20 Jun 2026 01:07:48 -0400, Guodong Xu wrote:
> The PDMA request numbers (DRQ) are fixed values specific to the SoC from
> a hardware perspective. The detailed definition can be found in K1 User
> Manual [1], Chapter 9.4.3 DMA Connectivity & Assignments. Add a DTS
> header file to define the symbolic names for the DRQs of non-secure DMA
> peripherals.
> 
> Convert the K1 SPI3 node to these macros.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: Use symbolic PDMA request numbers on K1
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d3cfc81d95384d555f5ffdd8730af186f302a0e8

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
