Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11D3BA22C;
	Wed,  7 Oct 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370945; cv=none; b=dh00nAVC4MF5mWe4kOlnHXaGD464y8rxXIe4kbc0h/+KWsqpwIqNBJ1M3ClD2J96zhh4KpG8YNFgKlLy+A2cLO91Oh7/sRO+9Or6hGwuKoqEpeYBG5VK3VX4KMxlr/t7aFiK3CMnx49anC3mj8Fi3P9kG2m3yXTh0SVDFLQldYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370945; c=relaxed/simple;
	bh=KwBBLqqCKnznuZc8ES/b/UBdGTCAH6GLFf9iGofEq4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uylf387l7oj6XBhvq0MalQsJqSTSDz4Oy01JRG2moCNmQ8V774I1m3XlL4mCVovyijXOItfco4Slw9Mg/glxrrNX7O9gMwejcSTzCvPM9JpFVPY2zxN/W4HHx2Dg/4vuEkgEwd5rwEPAotyEKIT39tQeLbALDs3JWaape6bpnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOL9GMye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOL9GMye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F521F0089B;
	Wed,  7 Oct 2026 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370918;
	bh=5A3nplckzikBnC17++XtnDzbEsH4s7yT4gNQXOe78DA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gOL9GMyeweNSLlRX71/Be5NmlLz3DLikc4WN30J0I738xgzMhK/DF2MOtmWEWaMbQ
	 jIzIWEKZLxJkTaJBljZQrFtJQ2moG8rcuBaQt9wSXpnt9/UaMMiLgLSpYGmAqN2Yi3
	 YHFiRzBXphb9GIDL53ZYe4bSae2idzCVSVHETiv1U1Q9Xf4/fYuup3nqo7R+jmP6Je
	 Bx2H6ffQsrofNj7veaCOB+tP0wAae832a7EX7bb1Yi4Bhqlj+/tW5r/ynCAgNq4W9t
	 aHHoJiHyXhGQBkprWlLdBs5oM2ZAftFeDigctxdKrm+At+D2RlQVXbTj7Kr7EXAdft
	 yKEgWYu4f95xQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>
References: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: dma40: Restore disabled-channels
Message-Id: <179137091617.420596.11979289002809557893.b4-ty@kernel.org>
Date: Wed, 07 Oct 2026 13:01:56 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 18 Sep 2026 17:46:45 +0200, Linus Walleij wrote:
> The conversion of the DMA40 binding to YAML omitted the optional
> disabled-channels property from the original text binding. The driver still
> parses this property, but additionalProperties: false rejects any device
> tree using it.
> 
> Restore disabled-channels and constrain it to the physical channel range.
> Also constrain memcpy-channels to the limits enforced by the driver and
> reject duplicate channel entries in both properties.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: dma40: Restore disabled-channels
      commit: 38d97b1122e02f6b8859e660990aaeda1c32e00f

Best regards,
-- 
~Vinod


