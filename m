Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168853;
	b=okHc4p3lC2/DKEVeRHPS9FuBeQflnjVhhFcnkYwcnlCR/DnLHzUOSG8f1XVR5GPExYac
	 AE+Cs5CmRb/M5Y8RLK9jijO64fwoNo3DFFsXphKyDOyaPX8FxQLQKbd8qOF05m+FWGhnX
	 C7G/SbtOpDZ7cFb2RqBPNJEaskrKbh8Xds8NzEX13624ZXvVZi1Ph0KX4DSH+52ITU4UZ
	 0a770WTGOeWoNvo1p+zmzoiNaWKQTmvdRcIdEnhZxmxTbtwP2tD/ihf83gZ4D9CPn1Y7c
	 8g+d0S9hQfi0BpUg6qZe/vBktrh3QMf/D4ieyFRALSo8dmEnvxdN28FxMLgqgKpy/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168853;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=+8y9yhTEZOPrM/t2ZLSTOX/rAP7Jv84iSq5JYylWrko=;
	b=k0ykwjHQMNBpuQEPkrV0O6n4yp42aIirA9f/Tf1y/iRedLw9t692dx218kPC9MTISp6s
	 xM98wOqNvdkhk/sBWQ1kE/WzvO+2rg5bOnY2XWd8s7R6J4OSy4HomGuAifVgujI9qKTkt
	 knm5O/4bcm/zL3kMxGhQePxhBkfE+/OHc6vfNGNJCiWMQ8wkOxaMmPj6PpP4LxXepzCbK
	 SVuEsiRZBaUYWoXoX5qf4mwVo2NhRUTC+I07E4zTXhHzJaLHQ43WyxJR36uJviKt9/mcb
	 hnh+dSRc4HnP46cj6fT95ZFbGReJKsdm8ZtoLVWpDqWh1btIV2TN+F7zKJFMXp+BtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCSRxWVM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A981606A320;
	Fri, 20 Nov 2026 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCSRxWVM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DA41F000D3;
	Fri, 20 Nov 2026 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168853;
	bh=+8y9yhTEZOPrM/t2ZLSTOX/rAP7Jv84iSq5JYylWrko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VCSRxWVMkjj/WYk6A6p7DTCVEGKwmvJyI4mxDT7Aj7qHEPdBnJF2PImFTfM52DoJ2
	 8GYZrlJbjLnbZszgao/IBwTdFwuCEk/O+cV81Adpqu7ZJfVRDv0tPUZEDsvobddnmw
	 ChAYosCMytQsMbKQyknaPlPWYJq4LyZTyvRr08Q5snr6xOGa2kWX/+CxdcfTAAyspQ
	 I8qgkETJBNRaPK4abrpqG6nwl9hqRRr6K4MSexVlyuTnK2sj2PhBganrcsAsnk2Bh+
	 ArpHLT4gZ5KFhqqFfH2tu+t5CbvFn7AhUmMq+O19z9b2OoJnSUuMVoypInY8jPR07t
	 2Rte+d8r/Xuxg==
From: Vinod Koul <vkoul@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112174613.2101876-1-suraj.gupta2@amd.com>
References: <20261112174613.2101876-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Xilinx AXI DMA driver
Message-Id: <179516885097.45276.12913506777592508035.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:30:50 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 12 Nov 2026 23:16:13 +0530, Suraj Gupta wrote:
> The Xilinx AXI DMA driver, which supports the AXI DMA, AXI CDMA, AXI
> VDMA and AXI MCDMA IPs, has no MAINTAINERS entry, so patches touching it
> are only picked up by the dmaengine subsystem catch-all.
> 
> Add an entry covering the driver, its binding and its header, with
> Srinivas Neeli and myself as maintainers.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Xilinx AXI DMA driver
      commit: ecb0d76d28f79827896b242479f8cdd53e74cdac

Best regards,
-- 
~Vinod


