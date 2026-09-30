Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7D45090A;
	Wed, 30 Sep 2026 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752980; cv=none; b=SWy7BIl/BUMWULYEOdO+xIYxIkRRevfJArCsl/JdPEcyCOgi66dnoKIdekkhSQx7smgtin26urG8oKICr+tGjw2DCPrVS5RW8WCGObuzb6gBoUJnBIs0OkIO4b78Wq02swzZoAJkEvt0gN45DSyPTg3dQXMk0BmpOJCcVR1hQAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752980; c=relaxed/simple;
	bh=6WPCKXDrK4HlXoB/bRAko8257iwE0s7ZcXFG3kZdjXQ=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=i9Xl/iIeXA42QuNFXB8/0kY/78Wlv9JTe1mFVpo8rwxxhN8OJigQ0kZnJqehz5GZH7gaOGeoEx/UJwMpA2O9QixWKfuACbtdqMHlkOSiUR7wADQwVUSuc1v3angz6esz8KUHdYjBSexN+/dz0zQ9T9GkHHqj2kFUlFRYwOdBQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=u3KC4B+I; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="u3KC4B+I"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xp1c3slZF9aZ329lhM+c9GDRbvB1vFE3cbAoP4eTrNA=;
	b=u3KC4B+Ib/qBvkobYbxBZ3/iVxIW8zTy6wk/bDYKPFkgRv6aI/IGgGDpi/5Ss6AsMUU1jRkek
	XcV65qU3YbCWjBwbB4JySHM1kZGJOmz0wUy6GviawWFOPSncfCqvnA91FUcaSIOKsblIvYk59X6
	wBdjbQJHteY6rWk8bvFyqLE=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hvmR60kS6z1K9D2;
	Wed, 30 Sep 2026 15:10:42 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id DDBF84057A;
	Wed, 30 Sep 2026 15:22:51 +0800 (CST)
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 30 Sep 2026 15:22:51 +0800
Message-ID: <6ABCB8CA.7040005@hisilicon.com>
Date: Wed, 30 Sep 2026 15:22:50 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to
 DT schema
References: <20260928124448.3754740-1-robh@kernel.org>
In-Reply-To: <20260928124448.3754740-1-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/9/28 20:44, Rob Herring (Arm) wrote:
> Convert the hisilicon,k3-dma-1.0 binding to DT schema format.
> 
> Add dma-channel-mask, dma-no-cci, dma-type and interrupt-names
> properties which were not documented.
> 
> The "hisilicon,hisi-pcm-asp-dma-1.0" doesn't have clocks, so make it
> optional.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!

Best Regards,
Wei
