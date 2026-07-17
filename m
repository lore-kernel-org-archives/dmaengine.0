Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92463264FB;
	Fri, 17 Jul 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291750; cv=none; b=dEY3D6KXGNPC6k9DoBarFhjuLA45KU9hcyVMeCNg37zc+9nnv/vMbrgYKwVRP1xVTwjJnF1Dkb0SMNIivpL8HsIav4TnSwQOGPiRLcvdyrCDeiqE+YXYyR6LPmIuvBsmWkf5hl6opqkT1QTFOQ9xBGqEbHL0t1fquyKfAitrdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291750; c=relaxed/simple;
	bh=ajzLF9EevqBYzigYQwDvaddPIE9fok7q7uTyxsnnFGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXAXSuvoYhLUY5Bbr2QfYSMHxHcbN4iu4l1kqfzKuXoGubu48P84OWg2lT948lD5Ib/ukAghjZkqrDozMZMfGAzM0E9iOuD43VsM2wHTHVAa2YClK8OKbI1CLkfbu7Cv3gHhN4ATMHDcp9SWNbAC9kNr88P/LmodDWndu34YWOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XO95b8XL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO95b8XL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206241F000E9;
	Fri, 17 Jul 2026 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291745;
	bh=YdRZ8cEOe1Id7kfF6xACpymocSI6ZKUIZZd+JQ61618=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XO95b8XLiHxA3QFXnLxzvNTan15MKYeW5WHJC/ZHvr6i6XRZTjJO89kBicTBbVhju
	 DFmpgEkq4ToD0QgsKDQsjYhWlE+EPGx0h484X6q/eEWlRT2cvs8CgsiYjsEmmQG5Xb
	 a5rUIvE4kwjsgbbmC5n2MzBBHXl14/Ahwd3sELG1OeTV0JqWN/RoCtBoMAYifLtO+e
	 LZTFmG4jGtla/0uYq8WhnwdfdrJYyk7m552cS5ZPH/a+gXGrOUJeuPmsjLcNl6qEPa
	 2SD0XwUI8KwN2PRns2UZs4Va0CEosD14Z8KaDMyVEB80HNgb+30JRsijgVcWgnpB+Q
	 Fkqw1uP+oJ8KQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260716202949.677290-1-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
Subject: Re: [PATCHv2 0/4] dma: fsl_raid: fix sparse warnings and simplify
 probing
Message-Id: <178429174372.1176696.4649080114921676634.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:43 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 16 Jul 2026 13:29:45 -0700, Rosen Penev wrote:
> This series cleans up the fsl_raid driver to address issues reported by
> sparse and to simplify its MMIO handling.
> 
> Patch 1 fixes the endianness of in-memory descriptor stores. The
> descriptor structs are handed to the device as big-endian, but the driver
> stored CPU-endian values directly, which is both incorrect and flagged by
> sparse as a base-type mismatch. The stores are wrapped in cpu_to_be32()
> and the final-frame bit is now passed as an argument rather than
> read-modify-written.
> 
> [...]

Applied, thanks!

[1/4] dma: fsl_raid: convert descriptor stores to big-endian
      commit: faa4ddedab7d75e0f28e2d14c14a428664deeb90
[2/4] dma: fsl_raid: set final bit via fill_cfd_frame() argument
      commit: 416e9fd2059631405031aaa033a7a7851467be86
[3/4] dma: fsl_raid: keep MMIO bases as void __iomem and cast at access
      commit: 68b7fbc235290937e4e2daa097896b6b94618f15
[4/4] dma: fsl_raid: use devm_platform_ioremap_resource
      commit: 30cb1b9fd4295f54d22b3a15ecf8525c9fe03ebe

Best regards,
-- 
~Vinod


