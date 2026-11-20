Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168868;
	b=ckN/5ZDezPRg87VFZXCBwjREwzjvLy70yU5BNH4TCGZV9M1f/8sidk7uPSqeXq50oyXh
	 flmR0TnQRaZcY72dd+9pEenJKrXa13Fvkg1WsKip2C0bKUM3ik8zQymmVkKj09i6ga1az
	 bQL/v+lwCpV39D+t40/G+OeuHu2193JUDYXOAz12xLCkhm7xhZoE6sq4ZUAPcRhzjKmFO
	 eyk9wk2ig8m7O4DX0LdFT+yrWJ3EM1NclxgOgbPShC74rLMar/4UWa0ScfLENqPca89JJ
	 5CAvEO6TN2vi4hHQoD09pQcr1YXDMUjTzuFmuM6Oh6yH3WD071GWaazQVl3ybRX1rCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168868;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=DCpWSp/M5LKclo/Ms5TofKoWj6yGMkGVnhoSpcpUUmE=;
	b=2IDWEYQKWXG7b/LMZa4irOZsa6ZfDLR+4LRzXEDxmRlMhFbPzP1HCYTS1GIJG1N4rcxY
	 +eN1BjlYNH0AgiCTVYRg77HpM0XzWn/sBCPk1p2YxIurvmBQXie2+zqMB4uqZuqjc5puF
	 RctxTPybUvo1DPOMpcZDyJR/sZu2gWO9sbNGE3BHenAL64yAdYx/NtMwgkP7bOVyTbOb3
	 x8KrkOyKp1woLL5WrOMsNygc38zutuBhof3pIwaGJhAAd+WoBxCD/01FAe88Ji9bdWHYc
	 I1R6juirN6Sv6diAK0GuxxpzpZcatlFcPA0V77rx+t5+WOzlbK6Mh8/7cPuG17JtM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gds1zrGo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5CD60A380A;
	Fri, 20 Nov 2026 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gds1zrGo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E09D1F000C4;
	Fri, 20 Nov 2026 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168868;
	bh=DCpWSp/M5LKclo/Ms5TofKoWj6yGMkGVnhoSpcpUUmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gds1zrGokF4bTD5/MTaN4CvuKIDPLDsULAnnljkmdtnA2gZVBQSVYahlnWRnRom4F
	 xAwenH/8fqhDXN5rZycHXGvvMMUGO/N1Htc+Ds8/DSTnTtmhggqRYaTgPwSeVhkx0w
	 ED9EV1r4Vkf3Is+PQUlfcFs2SLHeHhfXeywWGdXF7kbcx4+uOr0FAWjriB9u+1ca20
	 uJu8SjhXefllS1/WQL2GNu6NL9LGjvr17WkFP/h9c3TsaKXWgvN5Y5+612ihgqbgsv
	 ip2g/RAx+8ixPkYQg61/JqWByUeUcUdZSC1iKnzKbc0ExH+/v4jNG0Dfypln0wE14t
	 KFBTFatjyURUg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260919001931.723402-1-rosenp@gmail.com>
References: <20260919001931.723402-1-rosenp@gmail.com>
Subject: Re: [PATCHv4] dmaengine: bestcomm: use platform machinery to get
 irq
Message-Id: <179516886582.45276.6670084747027138465.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:05 +0530
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


On Fri, 18 Sep 2026 17:19:31 -0700, Rosen Penev wrote:
> platform_get_irq() avoids having to explicitly map and dispose of an irq
> by having the platform_device machinery take care of it.
> 
> This requires replacing the device_node with a platform_device in the
> bcom_eng struct so that platform_get_irq() can use it.
> 
> Conveniently, this also allows getting rid of of_node_get and
> of_node_put as the platform_device machinery also handles that.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: use platform machinery to get irq
      commit: 79e7dc8807afc1bf37861f893c8a0341e4238c3a

Best regards,
-- 
~Vinod


