Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6474EBAE4;
	Thu,  3 Sep 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452971; cv=none; b=OaH0aj+wtSukkq+aHhXqfmIMkJLCjVWlJT5iKpPBzYujj1TCWCbynniynLt5blcqS1oTiJLCxB7KeeecdWmfHBrKJ8ZeahwkOxIp/lWfL9ASYUMsFt2+YDn9r5fN9gYpcbmHkmVjsPEPZyfYABK1Upwlap0lg+3fL79vQoy+dUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452971; c=relaxed/simple;
	bh=gOOOo4f67uVX77koQgzwDwtjK5GcuceCL/+VkKsglZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FDC5BHCECIJrQUzoT/rqthnFMDJxLTn+AkJotWNsiMOycqt4k5qF6l+nzY2im0RnN8A2shxVDj05YvA7NVmrbDDCKuWebhwEvh0s6Eax7lJLkOL3zJbJaCPfzLyGQmtV90kHlGqACkBNJn34Cz9z12o0tgZNQlKPqw+6GFDcWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ah6E04XH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ah6E04XH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830411F00A3D;
	Thu,  3 Sep 2026 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452970;
	bh=20cLuCtv35nOGPSp26GXCtWQz+978Py2wpVagRLEtn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ah6E04XHemqWcnZfWagifjVqcghM6INsm42PLIDDpydX5wPdFijKsvk9v/hjQnEy1
	 9zo4dtqnjSYwRRDfi6+3ExT0vKCily1ZBiDApw1urEP2v1TWzgERyCrKcQkiS2Mr9L
	 zDQ8aFdl3NRrrHXpsowrdKwyz8Mtl6rALXRyCTOgkngw1+Siusgd1LBjwUItMIo6PT
	 VPE9CTWWcCNXhqa3E1yp5dbiv7SNJqvHSFjJ2oyi40j+cfZxcWaZeydXqo4t9B1tH+
	 ibVjJdaeoaJPZkWZRijkQPMsbRsTx6ka7TdGze7+e8sF841IbwHOVNBQNfFIJGwqhl
	 TUY4uGC+Aj7LA==
From: Vinod Koul <vkoul@kernel.org>
To: peter.ujfalusi@gmail.com, Alexander.Chesnokov@kaspersky.com
Cc: grygorii.strashko@ti.com, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
 Pavel.Zhigulin@kaspersky.com, Oleg.Kazakov@kaspersky.com
In-Reply-To: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
References: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
Subject: Re: [PATCH v3] dmaengine: ti: k3-udma-glue: fix NULL dereference
 in k3_udma_glue_release_rx_chn()
Message-Id: <178845296708.1679748.8016722423700487739.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 21:59:27 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 12 Aug 2026 08:34:26 +0300, Alexander.Chesnokov@kaspersky.com wrote:
> If devm_kcalloc() for rx_chn->flows fails in a channel request function,
> the error path calls k3_udma_glue_release_rx_chn(), which dereferences
> the NULL rx_chn->flows pointer in k3_udma_glue_release_rx_flow().
> 
> Skip the flow release loop in k3_udma_glue_release_rx_chn() when
> rx_chn->flows is not allocated.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_release_rx_chn()
      commit: 0294b6dd515256c03ea2dbf508ddd3826d788579

Best regards,
-- 
~Vinod


