Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9124A43FF;
	Fri,  9 Oct 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540904; cv=none; b=bEDmkYcpDn47qHaKKj0Hku8r1MGtBu/Sn9FU0p2ef9gFAuS4UjxLI5QEE9E07V6G8sOai10ADIhHN2LcLPRJ12vJFN/3jkfTrzzxm3yG4l/YyqLTt+q9VOpNcWYi9YEczXRziffzBGiOBIdRpzLuyMAaSmYihBNdptV4clLgeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540904; c=relaxed/simple;
	bh=j4+hFKV/Y1xPKuOucnsOGs+qKjF1m3z+83okARg8Vyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P9F+Cw384cpq4mMwNzOH7Hhd1QL5AbicNThhroTyZ6ey17D+mWvz4GaJIBtf+Cawj83BVwhdpXFFm2Cn1/CHj8aOUHAGGMqLeKV6qBM/C7MqSkay/8hvqidYL3dm/V/eyiMVaRVzHREbU51h9KcBWuyxDuxqMUeb/CCh6j5Zdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/PGLTly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/PGLTly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14FC1F00893;
	Fri,  9 Oct 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540903;
	bh=B5rqgJgCuEACOjNpftJeUp5JmU8JErv1+QYU/hl/ejA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g/PGLTly0l6QAnNAaVQuL7t501hkYDe9Br5lql5/ijv0Dj+vCRbUyiDKgace6IRlx
	 0cPtyCTpvQYYqmO9R61xxRdLlQRhy1gN4/ZZ8LUtxjzL+m6meo9Ce80htFIpDSdknz
	 IbaVLiL1w+PtfgkJVLVNz2xBXP870LQ2Z/xdOWmXKVhzCbrwZ5eaqzdjfOi7G0fORh
	 /kN0h90YFD59lJDf/e6jSRVW6Ir6B9GsCJ3qCEY4XSr1HtpJtafXCTn4xw7najUDpO
	 s0F8GhYEtKe1v5LJ06ucuCGhrng407s2gXU0hBPgT3JUwbLk+YlZotYFv4GBPcRpzj
	 0efOpKzd8aX5A==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261002195410.213610-1-Frank.Li@oss.nxp.com>
References: <20261002195410.213610-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: add dmaengine_desc_set_callback()
 helper
Message-Id: <179154090144.553139.768656652990535577.b4-ty@kernel.org>
Date: Fri, 09 Oct 2026 12:15:01 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 02 Oct 2026 15:54:09 -0400, Frank.Li@oss.nxp.com wrote:
> Add a dmaengine_desc_set_callback() inline helper that sets the
> callback, callback_result, and callback_param fields of a
> dma_async_tx_descriptor together in a single call.
> 
> Using this helper instead of open-coding the three field assignments
> ensures all three related fields are always updated consistently and
> makes call sites more readable.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: add dmaengine_desc_set_callback() helper
      commit: 562b6ed45db52934aaab9fbc856db3db79753155

Best regards,
-- 
~Vinod


