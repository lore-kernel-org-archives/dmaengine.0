Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473294C7525;
	Mon,  5 Oct 2026 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215002; cv=none; b=qnFSQxx2WMgTm9IbwaCbLpan/WyotYiaH5lJgKkd/YKQsI70XdnjrapNOCIhVkA/wuI/qv1i7JrmyKgZBxoVi91g2qYHGJdmnp0UZUN/HedfEPAnUHW8gShIIeNtB1M74oCKf8nvgTUtLprjBhiDvIivy5rZFlZ73fjNnZ6Xr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215002; c=relaxed/simple;
	bh=sBPJsWJD7jRbBco4v3/h7Y1y5JJ1gET+qXh1zu7Aq/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hi1cOOX+ogv2OvO1jgnfS2ZHCOPDRVUmtnA+91XVqjyNTY3h3C48xjgX5uLTQ+17pX3UztiIBMoiUOYPAz7WsWanHqdRNABL0n166BWUECWGW4SagyMfzoPxA2SLIznu/zNjuvd7jsdQdmrGc8MCPu/jR1mKgNnWDmUuggs2a8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIIV7NWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIIV7NWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4581F000FF;
	Mon,  5 Oct 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215001;
	bh=8C/WXXk9BgcOCU6GGY2Nv7ksbz/apVWdRbZj6d7ITWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QIIV7NWZqKFJJJtT9ys3tp5Mnh4G4tesKgNLzRx2ujYPCKR/D2KmPZzOKbqwylbiz
	 4pxMGYzrH8u9gS7yj/kzGcOoeT2qeskmym+l5rhR83dwT75DOMMF+1tWdYQ86DTzu5
	 pFNeqCboumhDrjZV0SX90W+75JZb/rIgMuDZOfgWFU+J+yFxp4MuFhBa+CDN0rzA79
	 ESz0N/k3sjXAEfDcER3bl61/eyAZWXFyc9cE83+d4p3lRmwf44MvGncqmT5T24xcEG
	 z7RWOEN4zId+Pp19y42vVfD//TJ2Vv5ZRkFQ52K2DcxGpCDE4AG/bJuaKOeMMEDge3
	 JoghItzdkVbnw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928124448.3754740-1-robh@kernel.org>
References: <20260928124448.3754740-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to
 DT schema
Message-Id: <179121499902.358863.7442676698125241084.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:19 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 28 Sep 2026 07:44:46 -0500, Rob Herring (Arm) wrote:
> Convert the hisilicon,k3-dma-1.0 binding to DT schema format.
> 
> Add dma-channel-mask, dma-no-cci, dma-type and interrupt-names
> properties which were not documented.
> 
> The "hisilicon,hisi-pcm-asp-dma-1.0" doesn't have clocks, so make it
> optional.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema
      commit: 6b0089d88669c87d69df6fa118c198024494a033

Best regards,
-- 
~Vinod


