Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD0353A6D;
	Thu,  2 Jul 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006326; cv=none; b=SrAlhS+Mhq64SjPCOOhmDGys/YA/cN8K89lsiKGrOfqmifVFejX7xy66j3O4VS9d6KrGsUxtae+q4m+vzdzmtg9vdXmLHBWmbTZ18kkg/7hHPOAkewjMjql0aIE5DsS00APv4HKrxbnJPdxmpBlvP6zvJ/bq5udTqZ8CWGnOgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006326; c=relaxed/simple;
	bh=0Au11BzDoZ6WbYbD94/aWaC10QjLDWSQyE+SafPW5CM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ETZRzb5dJcGI291IV9WweFS04GZBNRoZwXtJxhaiM2/QHhrdA4XF0KtwE+OM9IOVQ7pH1Vh6/h75uRD19Dz7mefrHag7YDASWtctkRVsjIJWx2+BEDzc0U5BOIl0plULOyMSe121HyVva+ZnNL8Ldw3rldQn9IBKURdWsWz0IEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaW+qLOr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaW+qLOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31601F00A3A;
	Thu,  2 Jul 2026 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006324;
	bh=jJ3DLTIlknojKBYsHiBKYugHEIBfbYTLpD95P/rrvbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XaW+qLOrHSkDMzJu6XPRHmFIpYJdsCBqaciYzbaiRU3sanrl2ntlnm2T+/tI1AoFj
	 aKbaNqItCSLp/5eKIQFZPwUXULZaKvTrXGoEt9/ysUR0Fa4U8pyXL4opAQ/wDz/RgQ
	 M80RX2y574G+0W0rM3bU2iTRK/f5nHFrdIXZe7ANyY/dBUiYdJUtP06KsVemLe70re
	 TGQAofhFPRrV0Ujg+0ea6JIEr4yKBoMfE5NxvrjIxuugAo2iXgR3iPw+htBwvJJVou
	 iJWz2VH97MY5Dztk9FsFQQcAfe34YqWW8WvX2ENNDeXTG5u7GhNS7T0g+bZ4Ck6vnS
	 D5B60OSW/o/zg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Abin Joseph <abin.joseph@amd.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260612215226.1887726-1-robh@kernel.org>
References: <20260612215226.1887726-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: xilinx: Fix "xlnx,irq-delay" type
Message-Id: <178300632060.735405.1201510775186759971.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:00 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 12 Jun 2026 16:52:25 -0500, Rob Herring (Arm) wrote:
> "xlnx,irq-delay" programs an 8-bit delay field in the DMA control
> register, and the driver stores and reads it as a byte. The binding
> described the property as a uint32 cell, which made the helper type
> check report the driver as wrong.
> 
> Document "xlnx,irq-delay" as uint8 so the generated schema reflects
> the hardware field width and the existing driver access.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: xilinx: Fix "xlnx,irq-delay" type
      commit: fa9cb11584851414b25fd8bf9f59518424b5917c

Best regards,
-- 
~Vinod


