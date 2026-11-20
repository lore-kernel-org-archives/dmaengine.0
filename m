Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168851;
	b=BpqWpeiEeGBdurNg76aVoGPbHxcIyPPs+MzumQKYEgNt2mULScFeT+LibaGAZjSB5rj0
	 7kmn0H0bfG1iWiAb+fv9dYLxEpXkrOtdBdhyXVNyWM38gaO4IPg5X6JkqqwhR9Nzmks9H
	 syQTS7tmw7UuFOveaFViGnPCPoAmrA2SIarftk++52/hohnsvPCE8ycyQM++AJVTOx8AA
	 8PhJLweU2V2dP9FXKP5uuL8hzwNBqWEZAFiT1BhU06MRtsO+JqKpq9p46WHw1vt9OQ5eT
	 nyZ3Xr6ifaBdjp7OpjCpP4TKcohUx2VVlS6TCGWqmqN1l1PkWL6UIUkx166hob1aq+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168851;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=kSE7ueWC59bGBXR0tWEZq922+9BqxS1bqdoH4YtX8qw=;
	b=ZKxUeFnhUysiHt2gPYQ9Hl64OXTVqUoKNsw5Y+suGMPkotEydMEfHGWj8QuGRUMYqyAU
	 fvFaLOY1Kymo/XQnizsaDQUwsikpq8KTGEWcR5K2IB3fGoSZ0roRMu1GHq6f4MbF4D6eB
	 L7I2YyaRgSwdm72s9dSPyxyQztt6GJIr3Kknv65ZWtkBRgHfXezkNvoqk/xPsp0s0BwMf
	 gaFMAbiu2QEPLCnw2iCkOFmAgfQaDRveFFgN//Do1QDWTOGmatLw/WzBTCc9RB0ZCKjpP
	 0SK+LVurjOu2GnWa9hqwXqGtGJFF5a1SMOi+m/wlUE4dczHddUvogdnAK8m/IitE1fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKD+r3rr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B62606A336
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKD+r3rr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8BB1F000D3;
	Fri, 20 Nov 2026 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168850;
	bh=kSE7ueWC59bGBXR0tWEZq922+9BqxS1bqdoH4YtX8qw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fKD+r3rrzFdteF3WLUD+xcu7z2AH4NsH588IXMs8I+OvaNoeSSRGZf0xZI8OTTx/h
	 bceVDV7HyKCfgBq/YX+8IjzQuh/B4eD2UoK70gc9Et+r+JvkzHSNrWhoniHGNuDzRa
	 q+juzQwX8FtAdkcsTHLiFruS6zwqqPXhMMLhHi1cE19t6IkWIHQWtBFc5YQ6P0jvr7
	 uUaZZp/I30X/PAhCs2YN7q1Nevv6pS5NVlq/8kxNdKICmYWr5BQzymH/Eb/mvE0XU+
	 NjY7QHGl9qAsBTR1OFEhFBvq8O8/MV0We9aGUdSd64BZ7GTnd2lhNU3IpveIwFwgZc
	 ZwX6pVLP9h5aQ==
From: Vinod Koul <vkoul@kernel.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260925054953.2965762-1-matthias.goergens@gmail.com>
References: <20260925054953.2965762-1-matthias.goergens@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: name the vkoul/dmaengine next branch
Message-Id: <179516884947.45276.10722523267458360604.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:30:49 +0530
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


On Fri, 25 Sep 2026 13:49:53 +0800, Matthias Goergens wrote:
> The T: entry for DMA GENERIC OFFLOAD ENGINE SUBSYSTEM names
> vkoul/dmaengine without a branch.  The repository's HEAD points to
> branch master, which mainline already contains.  linux-next merges the
> next branch of this repository (Next/Trees).  Name that branch in the
> entry.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: name the vkoul/dmaengine next branch
      commit: cf0bce289d851cbc44acc29231755c1fa60a6a33

Best regards,
-- 
~Vinod


